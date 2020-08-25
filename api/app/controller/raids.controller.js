const Raids = require('../model/raids.model')

exports.getRaids = async function(req, res) {
    const raidData = await Raids.getRaids()
    res.statusMessage = 'OK'
    res.status(200).json(raidData)
}

exports.getRaid = async function(req, res) {
    throw new Error('Not Implemented')
}