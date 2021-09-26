const { Pool} = require('pg')


let config;
if (process.env.NODE_ENV !== "production") {
  require('dotenv').config()
  config = {
    user: process.env.DBUSER,
    host: process.env.DBHOST,
    port: process.env.DBPORT,
    password: process.env.DBPASSWORD,
    database: process.env.DBNAME
  }
}else{
  config = {
    user: process.env.RDS_USERNAME,
    host: process.env.RDS_HOSTNAME,
    port: process.env.RDS_PORT,
    password: process.env.RDS_PASSWORD,
    database: process.env.RDS_DB_NAME
  }
}





const pool = new Pool(config)

module.exports = pool;
