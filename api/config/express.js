var express = require('express');
var jwt = require('express-jwt');
var jwks = require('jwks-rsa');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan')

var jwtCheck = jwt({
      secret: jwks.expressJwtSecret({
          cache: true,
          rateLimit: true,
          jwksRequestsPerMinute: 5,
          jwksUri: 'https://dev-jb7br8h2.au.auth0.com/.well-known/jwks.json'
    }),
    audience: 'https://d2-lfg.com/api/v1',
    issuer: 'https://dev-jb7br8h2.au.auth0.com/',
    algorithms: ['RS256']
});

exports.checkPermission = function(permission) {
    return (req, res, next) => {
        const {permissions} = req.user
        if (permissions.includes(permission)) return next()

        res.status(403).send()
    }
}

module.exports = function() {
    const app = express();
    app.use(helmet());
    app.use(bodyParser.json());
    app.use(cors());
    app.use(morgan('combined'));
    app.use(jwtCheck);
    app.use((req, res, next) => {
        console.log(`##### ${req.method} ${req.path} #####`);
        next();
    });

    app.rootUrl = '/api/v1'

    // ROUTES //
    require('../app/view/users.routes')(app)
    require('../app/view/raids.routes')(app)
    require('../app/view/games.routes')(app)

    return app
}
