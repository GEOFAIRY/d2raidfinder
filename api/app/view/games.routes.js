const games = require('../controller/games.controller')

module.exports = function(app) {
    app.route(app.rootUrl + '/games')
        .get(games.getGames)
        .post(games.createGame)
    app.route(app.rootUrl + '/games/:id')
        .get(games.getGame)
        .patch(games.patchGame)
        .delete(games.deleteGame)
    app.route(app.rootUrl + '/games/:id/join')
        .patch(games.joinGame)
    app.route(app.rootUrl + '/games/:id/leave')
        .patch(games.leaveGame)
}