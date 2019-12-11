const sql = require('mssql')
const env = require('./env.js')
const config = {
    user: env.user,
    password: env.password,
    server: 'localhost',
    database: env.db
}
const pool = new sql.ConnectionPool(config)
const poolConnect = pool.connect()

async function getUserByEmailPrepared(req, res) {
    const pool = await poolConnect
    try {
        //const request = new sql.Request(pool)
        const ps = new sql.PreparedStatement(pool)
        ps.input('email', sql.VarChar)
        ps.prepare(`SELECT * FROM TUser WHERE cEmail = @email`, err => {
            if (err) {
                console.log('SQL error', err)
            }
         
            ps.execute({email: req.body.email}, (err, response) => {
                if (err) {
                    console.log('SQL error', err)
                } else {
                    res.send(response.recordset)
                }
         
                // release the connection after queries are executed
                ps.unprepare(err => {
                    if (err) {
                        console.log('SQL error', err)
                    }         
                })
            })
        })

    } catch (err) {
        console.log('SQL error', err)
    }
}

async function getUserByEmail(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }

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

function getCreditCardsByUser(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        let query = `SELECT * FROM TCreditCard WHERE nUserID = '${req.params.userID}';`
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

function postProductBySearchSP(req, res) {
    console.log("SPPP")
    // To SQL inject, enter Cof' OR 1 = 1 --
    const query = `EXEC Search_withDefaultparameters '${req.body.name}', '${req.body.description}';`
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
    getCreditCardsByUser,
    postProductBySearch,
    postProductBySearchSP,
    getUserByEmailPrepared
}

module.exports = fncs