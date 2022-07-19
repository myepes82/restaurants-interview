const { Pool} = require('pg');
const logger = require('../logs/logger');
const fs = require('fs');

let config;
const { NODE_ENV } = process.env;
if(NODE_ENV !== 'production'){
    require('dotenv').config();
}
config = {
    user: process.env.RDS_USERNAME || 'postgres',
    host: process.env.RDS_HOST || 'db',
    port: process.env.RDS_PORT || 5432,
    password: process.env.RDS_PASSWORD || 'postgres',
    database: process.env.RDS_DB_NAME || 'postgres'
};



const pool = new Pool(config);
pool.connect((error, client, done )=> {
    if (error) {
        console.error('Error on db connection', error);
        logger.error('Error on db connection', error);
    }
    const database = fs.readFileSync(`${__dirname}/scripts/db.sql`, 'utf-8');
    console.log(client);
    client.query(database, (err, result)=> {
        if (err) {
            console.error('Error creating db', err);
            logger.error('Error creating db', err);
        }
        if (process.env.FILL_DATABASE === 'N') {
            done(client);
        }
        console.log(result);
    });

    if (process.env.NODE_ENV === 'production' && process.env.FILL_DATABASE === 'Y') {
        const dummyData = fs.readFileSync(`${__dirname}/scripts/dummy.sql`, 'utf-8');
        client.query(dummyData, (dummyErr, dummyResult)=>{
            if (dummyErr) {
                console.error('Error when filling the database ', dummyErr );
                logger.error('Error when filling the database ', dummyErr);
            }
            console.log(dummyResult);
            done(dummyResult);
        });
    }
});


module.exports = pool;
