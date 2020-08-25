const db = require('../../config/db')

exports.getRaids = async function() {
    const viewSQL = 'SELECT * FROM raid;'

    try {
        const raids = await db.getPool().query(viewSQL)

        return raids.map(raid => ({
            id: raid.id,
            name: raid.name,
            image: raid.image
        }))
    } catch (err) {
        console.error(`An error occurred during an sql query, ${err.message}`)
        throw err
    }
}