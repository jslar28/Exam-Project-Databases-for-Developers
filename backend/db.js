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

async function getUserByEmail(req, res) {
    const pool = await poolConnect
    try {
        //const request = new sql.Request(pool)
        const ps = new sql.PreparedStatement(pool)
        ps.input('email', sql.VarChar)
        ps.prepare(`SELECT * FROM TUser WHERE cEmail = @email`, err => {
            if (err) console.log('SQL error', err)

            ps.execute({ email: req.body.email }, (err, response) => {
                if (err) {
                    console.log('SQL error', err)
                } else {
                    res.send(response.recordset)
                }

                // release the connection after queries are executed
                ps.unprepare(err => {
                    if (err) console.log('SQL error', err)
                })
            })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}

async function getCreditCardsByUser(req, res) {
    const pool = await poolConnect
    try {
        //const request = new sql.Request(pool)
        const ps = new sql.PreparedStatement(pool)
        ps.input('userID', sql.Int)
        ps.prepare(`SELECT * FROM TCreditCard WHERE nUserID = @userID`, err => {
            if (err) console.log('SQL error', err)

            ps.execute({ userID: req.params.userID }, (err, response) => {
                if (err) {
                    console.log('SQL error', err)
                } else {
                    res.send(response.recordset)
                }

                // release the connection after queries are executed
                ps.unprepare(err => {
                    if (err) console.log('SQL error', err)
                })
            })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}

async function postProductBySearch(req, res) {
    const pool = await poolConnect
    try {
        //const request = new sql.Request(pool)
        const ps = new sql.PreparedStatement(pool)
        ps.input('name', sql.VarChar)
        ps.input('description', sql.VarChar)
        ps.prepare(`EXEC Search_withDefaultparameters @name, @description`, err => {
            if (err) console.log('SQL error', err)

            ps.execute(
                {
                    name: req.body.name,
                    description: req.body.description
                },
                (err, response) => {
                    if (err) {
                        console.log('SQL error', err)
                    } else {
                        res.send(response.recordset)
                    }

                    // release the connection after queries are executed
                    ps.unprepare(err => {
                        if (err) console.log('SQL error', err)
                    })
                })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}

async function asyncRatingTransaction(req, res) {
    const pool = await poolConnect
    try {
        const transaction = new sql.Transaction(pool)
        transaction.begin(err => {
            if (err) console.log('SQL error', err)

            let rolledBack = false
            transaction.on('rollback', aborted => {
                // emited with aborted === true
                rolledBack = true
            })
            const request = new sql.Request(transaction)
            request.query(`insert into mytable (mycolumn) values (12345)`, (err, result) => {

                // If we encounter an error, roll back
                if (err) {
                    // If we haven't rolled back, do it
                    if (!rolledBack) {
                        transaction.rollback(err => {
                            if (err) console.log('Rollback SQL error', err)
                        })
                    }
                } else {
                    transaction.commit(err => {
                        if (err) {
                            console.log('SQL error', err)
                        } else {
                            res.send(response)
                        }
                    })
                }
            })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}

async function buyTransation(req, res) {
    const pool = await poolConnect
    try {
        const transaction = new sql.Transaction(pool)
        transaction.begin(err => {
            if (err) console.log('SQL error', err)

            let rolledBack = false
            transaction.on('rollback', aborted => {
                // emited with aborted === true
                rolledBack = true
            })
            const request = new sql.Request(transaction)
            let queries = req.body.queries
            queries.forEach(async (query) => {
                request.query(`insert into mytable (mycolumn) values (12345)`, (err, result) => {

                    // If we encounter an error, roll back
                    if (err) {
                        // If we haven't rolled back, do it
                        if (!rolledBack) {
                            transaction.rollback(err => {
                                if (err) console.log('Rollback SQL error', err)
                            })
                        }
                    } else {
                        transaction.commit(err => {
                            if (err) {
                                console.log('SQL error', err)
                            } else {
                                res.send(response)
                            }
                        })
                    }
                })

            })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}


async function ratingTransaction(req, res) {
    const pool = await poolConnect
    try {
        var transaction = new sql.Transaction(pool);
        transaction.begin().then(() => {
            let rolledBack = false
            transaction.on('rollback', aborted => {
                // emited with aborted === true
                rolledBack = true
            })

            const ps = new sql.PreparedStatement(transaction)
            ps.input('userID', sql.Int)
            ps.input('productID', sql.Int)
            ps.input('score', sql.Numeric)
            ps.input('comment', sql.Text)
            // Insert rating
            ps.prepare(`INSERT INTO TRating(nUserID, nProductID, nScore, cComment)
                    VALUES (@userID, @productID, @score, @comment)`).then(() => {
                ps.execute({
                    userID: req.body.rating.nUserID,
                    productID: req.body.rating.nProductID,
                    score: req.body.rating.nScore,
                    comment: req.body.rating.cComment
                }).then((response) => {
                    console.log(response)
                    //res.send(response.recordset)
                    ps.unprepare(err => {
                        if (err) console.log('SQL error', err)
                    })

                    ps.input('averageRating', sql.Numeric)
                    ps.prepare(`UPDATE TProduct SET [nAverageRating] = @averageRating`).then(() => {
                        ps.execute({
                            averageRating: req.body.rating.score
                        }).then((response) => {
                            console.log(response)
                            //res.send(response.recordset)
                            ps.unprepare(err => {
                                if (err) console.log('SQL error', err)
                            })

                            transaction.commit().then((recordSet) => {
                                console.log(recordSet);
                                res.send(recordSet)
                            }).catch((err) => {
                                console.log("Error in Transaction Commit ", err);
                                if (!rolledBack) {
                                    transaction.rollback(err => {
                                        if (err) console.log('Rollback SQL error', err)
                                    })
                                }
                            });

                        }).catch((err) => {
                            console.log('SQL error', err)
                            if (!rolledBack) {
                                transaction.rollback(err => {
                                    if (err) console.log('Rollback SQL error', err)
                                })
                            }
                        })
                    }).catch((err) => {
                        console.log('SQL error', err)
                        if (!rolledBack) {
                            transaction.rollback(err => {
                                if (err) console.log('Rollback SQL error', err)
                            })
                        }
                    })

                }).catch((err) => {
                    console.log('SQL error', err)
                    if (!rolledBack) {
                        transaction.rollback(err => {
                            if (err) console.log('Rollback SQL error', err)
                        })
                    }
                })
            }).catch((err) => {
                console.log('SQL error', err)
                if (!rolledBack) {
                    transaction.rollback(err => {
                        if (err) console.log('Rollback SQL error', err)
                    })
                }
            })
        }).catch((err) => {
            console.log("Error in Transaction Begin ", err);
        });
    } catch (err) {
        console.log('SQL error', err)
    }
}

queries = {
    getUserByEmail,
    getCreditCardsByUser,
    postProductBySearch,
    ratingTransaction
}

module.exports = queries

function OLD_postProductBySearch(req, res) {
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