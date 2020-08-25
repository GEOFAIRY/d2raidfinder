const raids = require('../controller/raids.controller')

module.exports = function(app) {
    app.route(app.rootUrl + '/raids')
        .get(raids.getRaids)
    app.route(app.rootUrl + '/raids/:id')
        .get(raids.getRaid)
}