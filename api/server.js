require('dotenv').config()
const express = require('./config/express')
const db = require('./config/db')

const app = express()
var port = process.env.PORT || 8080

// Test connection to MySQL on start-up
async function testDbConnection() {
  try {
    await db.createPool()
    await db.getPool().getConnection()
  } catch (err) {
    console.error(`Unable to connect to MySQL: ${err.message}`)
    process.exit(1)
  }
}

testDbConnection().then(() => {
  app.listen(port, () => console.log(`##### API listening on ${port} #####`))
})
