const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const port = 3500
const db = require('./db')

app.use(cors())
app.use(bodyParser.json())

// GET REQUESTS

app.get('/creditCards/:userID', (req, res) => {
    db.getCreditCardsByUser(req, res)
})

// POST REQUESTS

app.post('/productSearch/', (req, res) => {
    db.postProductBySearchSP(req, res)
})

app.post('/login/', (req, res) => {
    db.getUserByEmailPrepared(req, res)
    //db.getUserByEmail(req, res)
})

app.listen(port, (err) => {
    if (err) {
        console.log("Error in express:")
        console.log(err)
    }
    console.log("App running on port: " + port)
})