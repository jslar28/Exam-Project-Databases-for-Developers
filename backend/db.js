const sql = require('mssql')
const env = require('./env.js')
const config = {
    user: env.user,
    password: env.password,
    server: 'localhost',
    database: env.db
}

function getUserByEmail(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        let query = `SELECT * FROM TUser WHERE cEmail = '${req.body.email}';`
        console.log(query)
        request.query(query, (err, response) => {
            if (err) {
                console.log("Query error:")
                console.log(err.message)
                res.send(err)
            } else {
                //console.log("Record set:")
                //console.log(response.recordset)
                res.send(response.recordset)
            }
        })
    })
}

function postProductBySearch(req, res) {
    // To SQL inject, enter Cof' OR 1 = 1 --
    const query = `SELECT * FROM TProduct 
        WHERE cName LIKE '%${req.body.name}%' 
        AND cDescription LIKE '%${req.body.description}%';`
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        request.query(query, (err, response) => {
            if (err) {
                console.log("Query error:")
                console.log(err.message)
                res.send(err)
            } else {
                //console.log(response.recordset)
                res.send(response.recordset)
            }
        })
    })
}


fncs = {
    getUserByEmail,
    postProductBySearch
}

module.exports = fncs