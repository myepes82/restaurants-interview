const { Pool} = require('pg');
const logger = require('../logs/logger');
const fs = require('fs');

let config;
if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
    config = {
        user: process.env.DBUSER,
        port: process.env.DBPORT,
        host: process.env.DBHOST,
        password: process.env.DBPASSWORD,
        database: process.env.DBNAME
    };
}else{
    config = {
        user: process.env.RDS_USERNAME,
        host: process.env.RDS_HOST,
        port: process.env.RDS_PORT,
        password: process.env.RDS_PASSWORD,
        database: process.env.RDS_DB_NAME
    };
}




const pool = new Pool(config);
pool.connect((error, client, done )=> {
    if (error) {
        console.error('Error on db connection', error);
        logger.error('Error on db connection', error);
    }
    const database = fs.readFileSync(`${__dirname}/scripts/db.sql`, 'utf-8');
    
    client.query(database, (err, result)=> {
        if (err) {
            console.error('Error creating db', err);
            logger.error('Error creating db', err);
        }
        if (process.env.NODE_ENV !== 'production') {
            done(client);
        }
        console.log(result);
    });

    if (process.env.NODE_ENV === 'production') {
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
