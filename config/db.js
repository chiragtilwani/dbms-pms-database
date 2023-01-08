const mysql = require("mysql");
const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "password",
  database: "pms",
});

db.connect(function (err) {
  if (err) console.log("not connected  to dbs", err);
  else console.log("connnected to dbs");
});

module.exports = db;
