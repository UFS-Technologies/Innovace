var db = require('../dbconnection');
var fs = require('fs');

var user_details =
{
  Save_user_details: function (user_details_, callback) {
    return db.query(
      "CALL Save_user_details(" +
      "@User_Details_Id_ :=?," +
      "@User_Details_Name_ :=?," +
      "@Password_ :=?," +
      "@Working_Status_ :=?," +
      "@User_Type_ :=?," +
      "@Role_Id_ :=?," +
      "@Address1_ :=?," +
      "@Address2_ :=?," +
      "@Address3_ :=?," +
      "@Address4_ :=?," +
      "@Mobile_ :=?," +
      "@Email_ :=?," +
      "@Country_Code_Name_ :=?," +
      "@Allow_App_Login_ :=?," +
      "@Department_Id_ :=?," +
      "@Department_Name_ :=?," +
      "@Branch_Id_ :=?," +
      "@Branch_Name_ :=?," +
      "@Employee_Code_ :=?," + 
      "@Designation_ :=?," +    
      "@DOJ_ :=?" +            
      ")",
      [
        user_details_.User_Details_Id,
        user_details_.User_Details_Name,
        user_details_.Password,
        user_details_.Working_Status,
        user_details_.User_Type,
        user_details_.Role_Id,
        user_details_.Address1,
        user_details_.Address2,
        user_details_.Address3,
        user_details_.Address4,
        user_details_.Mobile,
        user_details_.Email,
        user_details_.Country_Code_Name,
        user_details_.Allow_App_Login,
        user_details_.Department_Id,
        user_details_.Department_Name,
        user_details_.Branch_Id,
        user_details_.Branch_Name,
        user_details_.Employee_Code, 
        user_details_.Designation,    
        user_details_.DOJ            
      ],
      callback
    );
  },

  Update_User_Location: function (User_Details_Id, location, latitude, longitude, callback) {
    return db.query("CALL Update_User_Location(?, ?, ?, ?)", [User_Details_Id, location, latitude, longitude], callback);
  },
  Get_All_User_Location_Details: function (userName, callback) {
    return db.query("CALL Get_All_User_Location_Details(?)", [userName], callback);
},
  Delete_user_details: function (user_details_Id_, callback) {
    return db.query("CALL Delete_user_details(@user_details_Id_ :=?)", [user_details_Id_], callback);
  }
  ,
  Get_user_details: function (user_details_Id_, callback) {
    return db.query("CALL Get_user_details(@user_details_Id_ :=?)", [user_details_Id_], callback);
  }
  ,
  Search_user_details: function (user_details_Name_, callback) {
    if (user_details_Name_ === undefined || user_details_Name_ === "undefined")
      user_details_Name_ = '';
    return db.query("CALL Search_user_details(@user_details_Name_ :=?)", [user_details_Name_], callback);
  },
  Get_Menu_Permission: function (User_Id_, callback) {
    return db.query("CALL Get_Menu_Permission(@User_Id_ :=?)", [User_Id_], callback);
  },
  Search_conversion_Summary: function (Fromdate_, Todate_, By_User_, Login_User_Id_, look_In_Date_Value, callback) {

    return db.query("CALL Search_conversion_Summary(@Fromdate_ :=?,@Todate_ :=?,@By_User_ :=?,@Login_User_Id_ :=?,@look_In_Date_Value :=?)",
      [Fromdate_, Todate_, By_User_, Login_User_Id_, look_In_Date_Value], callback);
  },

  Search_Work_Summary: function (Fromdate_, Todate_, By_User_, Login_User_Id_, look_In_Date_Value, callback) {

    return db.query("CALL Search_Work_Summary(@Fromdate_ :=?,@Todate_ :=?,@By_User_ :=?,@Login_User_Id_ :=?,@look_In_Date_Value :=?)",
      [Fromdate_, Todate_, By_User_, Login_User_Id_, look_In_Date_Value], callback);
  },
  Search_Work_report: function (Fromdate_, Todate_, SearchbyName_, By_User_, Is_Date_Check_, Status_Id_, Login_User_Id_, callback) {

    return db.query("CALL Search_Work_report(@Fromdate_ :=?,@Todate_ :=?,@SearchbyName_ :=?,@By_User_ :=?,@Is_Date_Check_ :=?,@Status_Id_ :=?,@Login_User_Id_ :=?)",
      [Fromdate_, Todate_, SearchbyName_, By_User_, Is_Date_Check_, Status_Id_, Login_User_Id_], callback);
  },

  Save_Sub_Users: function (sub_user_data, callback) {
    return db.query("CALL Save_Sub_Users(" +
      "@User_Details_Id_ :=?," +
      "@Sub_User_Details_ :=?" +
      ")"
      , [sub_user_data.User_Details_Id,
      JSON.stringify(sub_user_data.Sub_User_Details)
      ], callback);
  },
  Get_Sub_Users: function (user_details_id, callback) {
    return db.query("CALL Get_Sub_Users(@User_Details_Id_ :=?)",
      [user_details_id],
      callback
    );
  }
};
module.exports = user_details;

