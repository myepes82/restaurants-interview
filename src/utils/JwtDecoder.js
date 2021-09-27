const jwt = require('jsonwebtoken');

function Decode(token){
    return jwt.decode(token.slice(7, token.length), {complete: true});
}

module.exports = {
    decode: Decode
};