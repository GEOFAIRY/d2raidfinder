const db = require('../../config/db')

exports.getRaids = async function () {
  const viewSQL = 'SELECT * FROM raid;'

  try {
    const raids = await db.getPool().query(viewSQL)

    return raids[0]
  } catch (err) {
    console.error(`An error occurred during an sql query, ${err.message}`)
    throw err
  }
}

exports.getRaid = async function (id) {
  const viewSQL =
    'SELECT raid.id as raidId, raid.name as raidName, raid.image as raidImage, phase.id as phaseId, phase.position as phasePosition, phase.name as phaseName FROM raid join phase on raid.id=phase.raidId where raid.id = 1;'

  try {
    const raid = await db.getPool().query(viewSQL, id)
    result = {
      id: raid[0][0].raidId,
      name: raid[0][0].raidName,
      image: raid[0][0].raidImage,
      phases: [],
    }

    raid[0].forEach((phase) => {
      result.phases.push({
        id: phase.phaseId,
        position: phase.phasePosition,
        name: phase.phaseName,
      })
    })
    return result
  } catch (err) {
    console.error(`An error occurred during an sql query, ${err.message}`)
    throw err
  }
}
