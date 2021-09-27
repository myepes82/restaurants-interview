const Server = require('./server');


if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
}

console.log(process.env.NODE_ENV);

const serverInstance  = new Server();

function main() {
    serverInstance.connect();
}


main();




