function handleError(error, rolledBack, transaction) {
    console.log('SQL error: ')
    console.log(error)
    if (!rolledBack) {
        transaction.rollback(err => {
            if (err) console.log('Rollback SQL error')
        })
    }
}

const invoicePromise = (ps, req, invoiceID, rolledBack, transaction) => {
    return new Promise((resolve, reject) => {
        ps.prepare(
            `INSERT INTO TInvoice(nTax, nTotalAmount, nCreditCardID)
                    OUTPUT INSERTED.nInvoiceID
                    VALUES (@tax, @totalAmount, @creditCardID)`
        ).then(() => {
            ps.execute({
                tax: req.body.purchase.tax,
                totalAmount: req.body.purchase.totalAmount,
                creditCardID: req.body.purchase.creditCardID,
                invoiceID
            }).then((response) => {
                ps.unprepare().then(() => {
                    resolve(response)
                }).catch((err) => {
                    console.log("Error when unpreparing INSERT INTO TInvoice")
                    reject(err)
                })
            }).catch((err) => {
                console.log("Error when executing INSERT INTO TInvoice")
                reject(err)
            })
        }).catch((err) => {
            console.log("Error when preparing INSERT INTO TInvoice")
            reject(err, rolledBack, transaction)
        })
    })
}

const invoiceLinePromise = (ps, product, invoiceID, rolledBack, transaction) => {
    return new Promise((resolve, reject) => {
        ps.prepare(
            `EXECUTE CheckStockAndInsertInvoiceLine 
                @quantity, @productID, @FKinvoiceID, @unitPrice;`
        ).then(() => {
            ps.execute({
                quantity: product.quantity,
                productID: product.nProductID,
                FKinvoiceID: invoiceID,
                unitPrice: product.unitPrice
            }).then((response) => {
                ps.unprepare().then(() => {
                    resolve(response)
                }).catch((err) => {
                    console.log("Error when unpreparing EXECUTE CheckStockAndInsertInvoiceLine")
                    reject(err)
                })
            }).catch((err) => {
                console.log("Error when executing EXECUTE CheckStockAndInsertInvoiceLine")
                reject(err)
            })
        }).catch((err) => {
            console.log("Error when preparing EXECUTE CheckStockAndInsertInvoiceLine")
            reject(err, rolledBack, transaction)
        })
    })
}

async function buyTransaction(req, res) {
    const pool = await poolConnect
    try {
        var transaction = new sql.Transaction(pool);
        transaction.begin().then(() => {
            let rolledBack = false
            transaction.on('rollback', (aborted) => {
                // emited with aborted === true
                rolledBack = true
            })

            const ps = new sql.PreparedStatement(transaction)

            ps.input('tax', sql.Numeric)
            ps.input('totalAmount', sql.Money)
            ps.input('creditCardID', sql.Int)
            ps.input('productID', sql.Int)
            ps.input('quantity', sql.Int)
            ps.input('FKinvoiceID', sql.Int)
            ps.input('unitPrice', sql.Money)
            ps.input('userID', sql.Int)

            ps.output('invoiceID', sql.Int)


            let invoiceID = 0
            invoicePromise(ps, req, invoiceID, rolledBack, transaction).then((response) => {
                invoiceID = response.recordset[0].nInvoiceID
                console.log(invoiceID)
                let howManyFinished = 0
                for (let i = 0; i < req.body.purchase.cart.length; i++) {
                    let product = req.body.purchase.cart[i]
                    invoiceLinePromise(ps, product, invoiceID, rolledBack, transaction).then((response) => {
                        console.log(response)
                        howManyFinished = req.body.purchase.cart.length
                        if (howManyFinished === req.body.purchase.cart.length) {
                            console.log("Should only see this once")
                            ps.unprepare().then(() => {
                                console.log({
                                    totalAmount: req.body.purchase.totalAmount,
                                    creditCardID: req.body.purchase.creditCardID,
                                })
                                console.log(ps.statement)
                                ps.prepare(`UPDATE TCreditCard SET nTotalAmountSpent = (nTotalAmountSpent + @totalAmount)
                                                WHERE nCreditCardID = @creditCardID`).then(() => {
                                    ps.execute({
                                        totalAmount: req.body.purchase.totalAmount,
                                        creditCardID: req.body.purchase.creditCardID,
                                    }).then((response) => {
                                        // if last, update credit card and user totalAmount
                                        console.log(response)
                                        //res.send(response.recordset)
                                        ps.unprepare().then(() => {
                                            ps.prepare(`UPDATE TUser
                                                        SET nTotalSpent = (nTotalSpent + @totalAmount)
                                                        WHERE nUserID = @userID`).then(() => {
                                                ps.execute({
                                                    totalAmount: req.body.purchase.totalAmount,
                                                    userID: req.body.purchase.userID,
                                                }).then((response) => {
                                                    // if last, update credit card and user totalAmount
                                                    console.log(response)
                                                    //res.send(response.recordset)
                                                    ps.unprepare().then(() => {
                                                        transaction.commit().then((recordSet) => {
                                                            console.log("COMMITTED")
                                                            console.log(recordSet);
                                                            res.send(recordSet)
                                                        }).catch((err) => {
                                                            console.log("Error in Transaction Commit ", err);
                                                            if (err) handleError(err, rolledBack, transaction)
                                                        });
                                                    }).catch((err) => {
                                                        if (err) handleError(err, rolledBack, transaction)
                                                    })
                                                    // Catch error when updating user total spent
                                                }).catch((err) => {
                                                    handleError(err, rolledBack, transaction)
                                                })
                                                // Catch error when preparing to update user total spent
                                            }).catch((err) => {
                                                console.log("Error when preparing update user")
                                                handleError(err, rolledBack, transaction)
                                            })
                                        }).catch((err) => {
                                            if (err) handleError(err, rolledBack, transaction)
                                        })
                                        // Catch error when updating credit card total amount spent
                                    }).catch((err) => {
                                        handleError(err, rolledBack, transaction)
                                    })
                                    // Catch error when preparing credit card total amount spent
                                }).catch((err) => {
                                    console.log("Error when preparing credit card update")
                                    handleError(err, rolledBack, transaction)
                                })
                            }).catch((err) => {
                                if (err) handleError(err, rolledBack, transaction)
                            })
                        } // End of if howManyFinished
                    }).catch((err) => {
                        handleError(err)
                    })
                } // End of for loop
            }).catch((err) => {
                handleError(err, rolledBack, transaction)
            })
        }).catch((err) => {
            console.log("Error in Transaction Begin ", err);
        });
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

// OLD TESTING QUERIES

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

async function OLDratingTransaction(req, res) {
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

async function OLDasyncRatingTransaction(req, res) {
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