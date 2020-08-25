const users = require('../controller/users.controller')

module.exports = function(app) {
    app.route(app.rootUrl + '/users/:id')
        .get(users.getUser)
        .patch(users.patchUser)
        .delete(users.deleteUser)
    app.route(app.rootUrl + '/users/:id/games')
        .get(users.getUserGamesHistory)
    app.route(app.rootUrl + '/users/:id/games/:gameid')
        .get(users.getUserGameHistory)
}