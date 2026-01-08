 var db=require('../dbconnection');
 var fs = require('fs');
 var followup=
 { 

  Save_followup: function (followup_, Customer_Id_,customFields_, callback) {
    console.log('customFields_: ', customFields_);
        // console.log('followup_: ', followup_);
         //console.log('Customer_Id: ', Customer_Id_);
         followup_=JSON.stringify(followup_)
            let customFieldsJson = null;
    if (customFields_ && Array.isArray(customFields_)) {
        const transformedCustomFields = customFields_.map(field => ({
            customefieldid: field.custom_field_id,
            datavalue: field.value
        }));
        customFieldsJson = JSON.stringify(transformedCustomFields);
    }
         return db.query("CALL Save_Followup(@FollowUp_ :=?,@Customer_Id_ :=?, @Custom_Fields :=?)", [followup_,Customer_Id_,customFieldsJson], callback);

     }
     ,
     Save_engineer_followup: function (followup_, Engineers_Id_, customFields_, callback) {
    console.log('Custom fields:', customFields_);
    
    // Convert follow-up object to JSON string
    followup_ = JSON.stringify(followup_);

    let customFieldsJson = null;
    if (customFields_ && Array.isArray(customFields_)) {
        // Transform custom fields to SP format
        const transformedCustomFields = customFields_.map(field => ({
            customefieldid: field.custom_field_id,
            datavalue: field.value
        }));
        customFieldsJson = JSON.stringify(transformedCustomFields);
    }

    const sqlQuery = "CALL Save_engineer_followup(?, ?, ?)";
    const parameters = [followup_, Engineers_Id_, customFieldsJson];

    console.log("Executing SP with parameters:", parameters);

    return db.query(sqlQuery, parameters, callback);
},


 Delete_followup:function(followup_Id_,callback)
 { 
return db.query("CALL Delete_followup(@followup_Id_ :=?)",[followup_Id_],callback);
 }
 ,
 Get_followup:function(followup_Id_,callback)
 { 
return db.query("CALL Get_followup(@followup_Id_ :=?)",[followup_Id_],callback);
 }
 ,
 Search_followup:function(followup_Name_,callback)
 { 
 if (followup_Name_===undefined || followup_Name_==="undefined" )
followup_Name_='';
return db.query("CALL Search_followup(@followup_Name_ :=?)",[followup_Name_],callback);
 },
     FollowUp_Summary: function (User_, callback) {

         return db.query("CALL FollowUp_Summary(@User_ :=?)", [User_], callback);
     },
     Dashboard_FollowUp_Summary: function (User_, callback) {
        if(User_ == undefined || User_ == "undefined"){
            User_=''
        }

        return db.query("CALL Dashboard_FollowUp_Summary(@User_ :=?)", [User_], callback);
    },
     Pending_FollowUp: function (By_User_, callback) {

        return db.query("CALL Pending_FollowUp(@By_User_ :=?)", [By_User_], callback);
    }
  };
  module.exports=followup;

