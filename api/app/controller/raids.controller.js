const Raids = require('../model/raids.model')

exports.getRaids = async function(req, res) {
    let raidData = await Raids.getRaids()
    res.statusMessage = 'OK'
    res.status(200).json(raidData)
}

exports.getRaid = async function(req, res) {
    let raidData = await Raids.getRaid(req.params.id)
    res.statusMessage = 'OK'
    res.status(200).json(raidData)
}