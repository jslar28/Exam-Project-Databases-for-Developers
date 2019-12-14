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
        ps.input('description', sql.TEXT)
        ps.prepare(`EXEC SearchProduct @name, @description`, err => {
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

async function ratingTransaction(req, res) {
    const pool = await poolConnect
    try {
        const ps = new sql.PreparedStatement(pool)
        ps.input('userID', sql.Int)
        ps.input('productID', sql.Int)
        ps.input('score', sql.Numeric)
        ps.input('comment', sql.Text)
        console.log(req.body)
        ps.prepare(`EXECUTE RateProduct @userID, @productID, @score, @comment`, err => {
            if (err) console.log('SQL error', err)

            ps.execute({
                userID: req.body.rating.nUserID,
                productID: req.body.rating.nProductID,
                score: req.body.rating.nScore,
                comment: req.body.rating.cComment
            }, (err, response) => {
                if (err) {
                    console.log('SQL error', err)
                } else {
                    console.log(response)
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

// Accept body:
//  {
//      tax
//      totalAmount
//      creditCardID
//      userID
//      cart: [
//          product: {
//              nProductID
//              quantity
//              unitPrice
//          }
//      ]
//  }
async function buyTransaction(req, res) {
    const pool = await poolConnect
    try {
        const ps = new sql.PreparedStatement(pool)
        ps.input('tax', sql.Numeric)
        ps.input('totalAmount', sql.Money)
        ps.input('creditCardID', sql.Int)
        ps.input('userID', sql.Int)
        ps.input('jsonProducts', sql.NVarChar)
        console.log(req.body.purchase.cart)
        ps.prepare(`EXECUTE BuyProduct @tax, @totalAmount, @creditCardID, @userID, @jsonProducts`, err => {
            if (err) console.log('SQL error', err)

            ps.execute({
                tax: req.body.purchase.tax,
                totalAmount: req.body.purchase.totalAmount,
                creditCardID: req.body.purchase.creditCardID,
                userID: req.body.purchase.userID,
                jsonProducts: JSON.stringify(req.body.purchase.cart)
            }, (err, response) => {
                if (err) {
                    console.log('SQL error when executing BuyProduct', err)
                } else {
                    console.log(response)
                    res.send(response.recordset)
                }

                // release the connection after queries are executed
                ps.unprepare(err => {
                    if (err) console.log('SQL unprepare error', err)
                })
            })
        })
    } catch (err) {
        console.log('SQL error', err)
    }
}

queries = {
    getUserByEmail,
    getCreditCardsByUser,
    postProductBySearch,
    ratingTransaction,
    buyTransaction
}

module.exports = queries