const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const port = 3500
const db = require('./db')


app.use(cors())
app.use(bodyParser.json())

app.post('/', (req, res) => {
    // Query here
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
        }
        let request = new sql.Request()
        request.query('SELECT * FROM TGreetings', (err, recordset) => {
            console.log(recordset)
            if(err) console.log(err)
            res.send(recordset.recordset)
        })
    })
})

app.post('/greeting', (req, res) => {
    console.log(req.body)
    db.postGreeting(req, res)
})


app.listen(port, (err) => {
    if (err) {
        console.log("Error in express:")
        console.log(err)
    }
    console.log("App running on port: " + port)
})