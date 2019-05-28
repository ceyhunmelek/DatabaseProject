var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var mysql = require('mysql');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

// connection configurations
var dbConn = mysql.createConnection({
    host: '',
    user: '',
    password: '',
    database: ''
});

// connect to database
dbConn.connect(); 

app.all('*', function(req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header("Access-Control-Allow-Headers", "X-Requested-With");
   next();
});

// Retrieve observarions 
app.get('/average/:yr/:mo/:type', function (req, res) {
    const year = req.params.yr;
    const month = req.params.mo;
    const type = req.params.type;
    const sqlquery = "select weather_stations.wsid, weather_stations.lat,weather_stations.lon,avg(obsValues.value) as 'average'  from obsValues join observations use index(bydate) on obsValues.obsID = observations.obsID join weather_stations on observations.wsid = weather_stations.wsid where observations.datetime like '%" + year + month + "%' and obsValues.valueID='" + type + "' group by weather_stations.wsid,weather_stations.lat,weather_stations.lon order by avg(obsValues.value) desc;"
    console.log(sqlquery);
    if (!year | !month | !type) {
     return res.status(400).send({ error: true, message: 'Please provide all parameter' });
    }
    dbConn.query(sqlquery, function (error, results, fields) {
     if (error) throw error;
      return res.send({ error: false, data: results, message: 'fetched list.' });
    });
});

// default route
app.get('/', function (req, res) {
    return res.send({ error: true, message: 'hello' })
});
// set port
server = app.listen(9000, function () {
    console.log('API is running on port 9000');
});
server.timeout = 60000;
module.exports = app;
