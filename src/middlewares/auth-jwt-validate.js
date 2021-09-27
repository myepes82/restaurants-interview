const jwt = require('jsonwebtoken');


function verifyToken(req, res, next){
    const token = req.header('Authorization');
    if (!token && !token.startsWith('Bearer ')) {
        return res.status(401).json({error: 'Missing auth token'});
    }
    try {
        const verified = jwt.verify(token.slice(7, token.length), process.env.SECRET);
        req.user = verified;
        next();
    } catch (error) {
        res.status(401).json({error: 'Token has expired'});
    }
}

module.exports = verifyToken;