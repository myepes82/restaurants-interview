/* eslint-disable no-async-promise-executor */
const tokenDecoder = require('../utils/JwtDecoder');
const joi = require('@hapi/joi');
const logger = require('../logs/logger');
const db = require('../db/db');

function Save(req) {
    return new Promise(async (resolve, reject) => {
        let userId;
        try {
            const data = await getDecodedToken(req);
            userId = data.id;
        } catch (error) {
            reject([404, { error }]);
        }
        const restauranSchemeValidator = joi.object({
            name: joi.string().min(2).max(100).required(),
            address: joi.string().min(10).max(255).required(),
        });

        const { error } = restauranSchemeValidator.validate(req.body);

        if (error) {
            console.error(error);
            return reject([400, { error: error.details[0].message }]);
        }

        const body = req.body;

        try {
            const dataToSave = [
                body.name,
                body.address,
                false,
                Date.now(),
                userId,
                0,
            ];
            await db.query(
                'INSERT INTO restaurants (name, address, public, creation_date, user_id, total_likes) VALUES($1, $2, $3, to_timestamp($4 / 1000.0), $5, $6)',
                dataToSave
            );
            return resolve({ data: 'The restaurant has been saved' });
        } catch (error) {
            console.error('Error saving restaurant: ', error);
            logger.error('Error saving restaurant: ' , error);
            return reject([500, { error: 'An error has ocurred, please try again.' }]);
        }
    });
}

function GetAllByUser(req) {
    return new Promise(async (resolve, reject) => {
        let userId;

        let pageNumber = req.query['page'];
        let pageSize = req.query['size'];
        if (!pageNumber) {
            pageNumber = 0;
        }
        if (!pageSize) {
            pageSize = 10;
        }

        try {
            const decodedToken = await getDecodedToken(req);
            userId = decodedToken.id;
            if (!userId) {
                return reject([404, {error: 'User identifier not found'}]);
            }
        } catch (error) {
            return reject([404, { error: 'User identifier not found' }]);
        }

        try {
            const { rows } = await db.query(
                'SELECT COUNT(restaurants.id) as totalElements FROM restaurants where restaurants.user_id = $1',
                [userId]
            );
            const totalElements = rows[0].totalelements;
            const totalPages = Math.ceil(totalElements / pageSize);
            if (pageNumber >= totalPages && pageNumber > 1 && totalPages > 0) {
                pageNumber = totalPages - 1;
            } else if (pageNumber >= totalPages && totalPages === 0) {
                pageNumber = 0;
            }
            const results = await db.query(
                'SELECT * FROM restaurants where restaurants.user_id = $1 limit $2 offset $3',
                [userId, pageSize, pageNumber * pageSize]
            );
            resolve({
                totalElements: totalElements,
                totalPages: Math.ceil(totalElements / pageSize),
                size: pageSize,
                page: parseInt(pageNumber, 10) + 1,
                elements: results.rowCount,
                data: results.rows,
            });
        } catch (error) {
            console.error('Searching restaurants error: ', error);
            logger.error('Searching restaurants error: ', error);
            return reject([500, { error: 'An error has ocurred, please try again.' }]);
        }
    });
}

function GetAllPublicRestaurants(req) {
    return new Promise(async (resolve, reject) => {
        let pageNumber = req.query['page'];
        let pageSize = req.query['size'];
        if (!pageNumber) {
            pageNumber = 0;
        }
        if (!pageSize) {
            pageSize = 10;
        }
        try {
            let { rows } = await db.query('SELECT COUNT(r.id) as totalElements FROM restaurants AS r WHERE r.public=\'true\'');

            const totalElements = rows[0].totalelements;
            const totalPages = Math.ceil(totalElements / pageSize);
            if (pageNumber >= totalPages && pageNumber > 1 && totalPages > 0) {
                pageNumber = totalPages - 1;
            } else if (pageNumber >= totalPages && totalPages === 0) {
                pageNumber = 0;
            }

            let results = await db.query(
                'SELECT r.id, r.name, r.address, r.public AS is_public, r.total_likes  FROM restaurants AS r WHERE r.public=\'true\' ORDER BY r.name DESC LIMIT $1 OFFSET $2 ;',
                [pageSize, pageNumber * pageSize]
            );
            return resolve({
                totalElements: totalElements,
                totalPages: Math.ceil(totalElements / pageSize),
                size: pageSize,
                page: parseInt(pageNumber, 10) + 1,
                elements: results.rowCount,
                data: results.rows,
            });

        } catch (error) {
            console.log('Error searching all publics restaurants: ', error);
            logger.error('Error searching all publics restaurants: ', error);
            return reject([500, { error: 'An error has ocurred, please try again.' }]);
        }
    });
}

function LikeRestaurant(req) {
    return new Promise(async (resolve, reject) => {
        let userId;
        const restaurantId = req.query['restaurantId'];
        if (!restaurantId) {
            console.error('Restaurant identifier is not present');
            return reject([404, { error: 'Restaurant identifier is not present' }]);
        }
        try {
            const data = await getDecodedToken(req);
            userId = data.id;
            if (!userId) {
                return reject([404, {error: 'User identifier not found'}]);
            }
        } catch (error) {
            console.error('User id not found');
            return reject([404, { error: 'User identifier not found' }]);
        }

        try {
            const {rows} = db.query('SELECT * FROM restaurants WHERE restaurants.id = $1', [restaurantId]);
            if (rows.length === 0) {
                return reject([404, {error: 'Restaurant not found'} ]);
            }
            if (rows[0].public !== undefined && !rows[0].public) {
                return reject([400, {error: 'Restaurant not available to like'}]);
            }
            await db.query(
                'INSERT INTO linked_restaurants (user_id, restaurant_id, like_date) VALUES ( $1, $2, to_timestamp($3 / 1000.0))',
                [userId, restaurantId, Date.now()]
            );
            await db.query(
                `
      UPDATE restaurants SET total_likes=likes.total_likes + 1 , update_date=to_timestamp($2 / 1000.0) FROM( SELECT total_likes FROM restaurants where restaurants.id = $1) 
      as likes where restaurants.id = $1`,
                [restaurantId, Date.now()]
            );
            return resolve({ data: 'The like has been registered' });
        } catch (error) {
            console.error('Registration like error: ', error);
            logger.error('Registration like error: ', error);
            return reject([500, { error: 'An error has ocurred, please try again.' }]);
        }
    });
}

function GetMyLikedRestaurants(req) {
    return new Promise(async (resolve, reject) => {
        let userId;
        let pageNumber = req.query['page'];
        let pageSize = req.query['size'];
        if (!pageNumber) {
            pageNumber = 0;
        }
        if (!pageSize) {
            pageSize = 10;
        }
        try {
            const data = await getDecodedToken(req);
            userId = data.id;
            if (!userId) {
                return reject([404, {error: 'User identifier not found'}]);
            }
        } catch (error) {
            console.error('User id not found');
            return reject([404, { error: 'User identifier not found' }]);
        }
        try {
            const { rows } = await db.query(
                `SELECT COUNT(linked_restaurants.id) AS totalElements FROM linked_restaurants  
        JOIN restaurants AS r ON linked_restaurants.restaurant_id = r.id
        WHERE linked_restaurants.user_id = $1 AND r.public = 'true';`,
                [userId]
            );

            const totalElements = rows[0].totalelements;
            const totalPages = Math.ceil(totalElements / pageSize);
            if (pageNumber >= totalPages && pageNumber > 1 && totalPages > 0) {
                pageNumber = totalPages - 1;
            } else if (pageNumber >= totalPages && totalPages === 0) {
                pageNumber = 0;
            }
            const results = await db.query(
                `SELECT r.id, r.name, r.address, lr.like_date FROM linked_restaurants AS lr INNER JOIN restaurants AS r ON lr.id  = r.id
        WHERE lr.user_id = $1 AND r.public = 'true' ORDER BY r.name DESC LIMIT $2 OFFSET $3`,
                [userId, pageSize, pageNumber * pageSize]
            );
            return resolve({
                totalElements: totalElements,
                totalPages: Math.ceil(totalElements / pageSize),
                size: pageSize,
                page: parseInt(pageNumber, 10) + 1,
                elements: results.rowCount,
                data: results.rows,
            });
        } catch (error) {
            console.error('Searching liked restaurants error: ', error);
            logger.error('Searching liked restaurants error: ', error);
            return reject([500, { error: 'An error has ocurred, please try again.'}]);
        }
    });
}
function UpdateRestaurant(req){
    return new Promise(async(resolve, reject)=>{
        if (!req.body) {
            console.error('Request Body not found');
            return reject([404, {error: 'Request body not found'}]);
        }
        
        if (!req.body.id) {
            console.error('Restaurant id not found');
            return reject([404, {error: 'Restaurant identifier not found'}]);
        }
        const body = req.body;

        let userId;

        try {
            const data = await getDecodedToken(req);
            userId = data.id;
            if (!userId) {
                return reject([404, {error: 'User identifier not found'}]);
            }
        } catch (error) {
            console.error('User id not found');
            return reject([404, {error: 'User identifier not found'}]);
        }
        let foundRestaurant;
        try {
            const {rows} = await db.query('SELECT * FROM restaurants AS restaurant  WHERE restaurant.id = $1 AND restaurant.user_id = $2', [req.body.id, userId]);
            if (rows.length === 0) {
                console.error('Restaurant not found');
                return reject([404, {error: 'Restaurant not found'}]);
            }
            foundRestaurant = rows[0];
        } catch (error) {
            console.error('Error searching restaurant: ', error);
            logger.error('Error searching restaurant', error);
            return reject([500, {error: 'An error has ocurred, please try again.'}]);
        }

        try {
            const publicR = body.public !== undefined && typeof body.public === 'boolean' ? body.public : foundRestaurant.public;
            const nameR = body.name !== undefined && typeof body.name === 'string' && body.name.length > 2 && body.name.length < 100 ? body.name : foundRestaurant.name;
            const addressR = body.address !== undefined && typeof body.address === 'string' && body.address.length > 10 && body.address.length < 255 ? body.address : foundRestaurant.address;
            await db.query(
                'UPDATE restaurants SET name = $1,  address = $2,  public = $3 ,  update_date = to_timestamp($4 / 1000.0) WHERE id = $5', 
                [nameR, addressR, publicR, Date.now(), req.body.id]);
            return resolve({data: 'Restaurant updated'});
        } catch (error) {
            console.error('Error updationg restaurant ', error);
            logger.error('Error updating restaurant: ', error );
            return reject([500, {error: 'An error has ocurred, please try again.'}]);
        }
    });
}


function getDecodedToken(req) {
    return new Promise((resolve, reject) => {
        const header = req.header('Authorization');
        if (!header) {
            console.error('Header token is not present');
            return reject([404, { error: 'Authentication header not found' }]);
        }
        const tokenDecoded = tokenDecoder.decode(header);
        const user = tokenDecoded.payload;
        if (!user && !user.id) {
            console.error('Header token is not present');
            return reject([404, { error: 'Missing arguments' }]);
        }
        return resolve(user);
    });
}


module.exports = {
    save: Save,
    getAllByUser: GetAllByUser,
    likeRestaurant: LikeRestaurant,
    getMyLikedRestaurants: GetMyLikedRestaurants,
    getAllPublicRestaurants: GetAllPublicRestaurants,
    updateRestaurant: UpdateRestaurant
};
