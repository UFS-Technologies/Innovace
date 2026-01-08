const expressJwt = require('express-jwt');
const jwt1 = require('jsonwebtoken');
const config = require('../config.json');
module.exports = jwt;

function jwt() {
    const { secret } = config;

    return expressJwt({
        getToken: function fromHeaderOrQuerystring(req) {
            if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
                const decoded = jwt1.verify(req.headers.authorization.split(' ')[1], config.secret);
                req.User_Details_Id = decoded.sub.User_Details_Id;
                return req.headers.authorization.split(' ')[1];
            } else if (req.query && req.query.token) {
                return req.query.token;
            }
            return null;
        },
        secret,
        algorithms: ['HS256'] // ✅ add this to prevent deprecation warning
    }).unless({
        path: [
            // public routes that don't require authentication
            '/Login',
            '/Public',
            { url: /^\/socket.io\/.*/, methods: ['GET', 'POST'] }  // ✅ Exclude socket.io
        ]
    });
}
