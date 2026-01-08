const db = require('../dbconnection'); 

var dashboard = {
    Fetch_dashboard1: function (User_Details_Id, callback) {
        console.logg(User_Details_Id,'dd')
        if (department_name_ === undefined || department_name_ === "undefined") {
            department_name_ = '';
        }
        try
        {
        return db.query("CALL Get_Grouped_Tasks_By_Department();",
            [User_Details_Id],
            callback);
        }
        catch(e){console.log(e)}
    }
,
  Fetch_dashboard: function (User_Details_Id,callback) {
    try {
      console.log();
      
      const query = "CALL Get_Grouped_Tasks_By_Department(?)";
      db.query(query, [User_Details_Id], (err, result) => {
      if (err) {
        callback(err, null);
      } else {
        callback(null, result);
      }
      });
    } catch (error) {
      console.log('Get_Task_Info_Dashboard',error);
      callback(err, null);
    }
    
  },


};

module.exports = dashboard;