const sql = require('mssql')
const env = require('./env.js')
const config = {
    user: env.user,
    password: env.password,
    server: 'localhost',
    database: env.db
}



function postGreeting(req, res) {
    sql.connect(config, (err) => {
        if (err) {
            console.log(err)
            console.log("dummy change")
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
    postGreeting
}

module.exports = fncs