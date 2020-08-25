const mysql = require('mysql2')

let pool = null

exports.createPool = async function() {
    pool = mysql.createPool({
        multipleStatements: true,
        host: process.env.MYSQL_HOST,
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD,
        database: process.env.MYSQ_DB
    })
    pool = pool.promise()
}

exports.getPool = function() {
    return pool;
}