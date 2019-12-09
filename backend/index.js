const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const port = 3500
const db = require('./db')


app.use(cors())
app.use(bodyParser.json())

app.get('/zipCodes', (req, res) => {
    db.getAllZipCodes(req, res)
})

app.get('/zipCode/:id', (req, res) => {
    db.getCityNameByZipCode(req, res)
})

app.post('/productSearch/', (req, res) => {
    db.postProductBySearch(req, res)
})


app.listen(port, (err) => {
    if (err) {
        console.log("Error in express:")
        console.log(err)
    }
    console.log("App running on port: " + port)
})