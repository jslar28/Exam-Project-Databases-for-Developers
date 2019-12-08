const sql = require('mssql')
const env = require('./env.js')
const config = {
    user: env.user,
    password: env.password,
    server: 'localhost',
    database: env.db
}

function getAllZipCodes(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        let query = `SELECT * FROM TZipCode;`
        request.query(query, (err, recordset) => {
            if(err) {
                console.log(err)
            } else {
                console.log(recordset.recordset)
            }
            res.send(recordset.recordset)
        })
    })
}

function getCityNameByZipCode(req, res) {
    console.log("HERE")
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        console.log("HEY")
        console.log(req.params.id)
        let query = `SELECT * FROM TZipCode WHERE cZipCode = ${req.params.id};`
        request.query(query, (err, recordset) => {
            if(err) {
                console.log(err)
            } else {
                console.log(recordset.recordset)
                res.send(recordset.recordset)
            }
        })
    })
}

function postGreeting(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        let query = `INSERT INTO TGreetings (cGreeting) VALUES ('${req.body.greeting}');`
        request.query(query, (err, recordset) => {
            if(err) console.log(err)
            res.send(recordset.recordset)
        })
    })
}

fncs = {
    postGreeting,
    getAllZipCodes,
    getCityNameByZipCode
}

module.exports = fncs