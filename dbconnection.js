var mysql = require("mysql2");
var connection = mysql.createPool({

    // host:"DESKTOP-IK6ME8M",
   // user: "Bilal",
   // password: "root",
   // database: "thirdeye",
   host:"localhost",
   user:"root",
   password:"fathimapt@11",
   database:"innovace_db",
  
    
});
connection.on("connect", function() {
   console.log("Connected to the database");
});
module.exports = connection;

