 var db=require('../dbconnection');
 var fs = require('fs');
 var working_status=
 { 
 Save_working_status:function(working_status_,callback)
 { 
return db.query("CALL Save_working_status("+
"@Working_Status_Id_ :=?,"+
"@Working_Status_Name_ :=?"+")"
 ,[working_status_.Working_Status_Id,
working_status_.Working_Status_Name
],callback);
 }
 ,
 Delete_working_status:function(working_status_Id_,callback)
 { 
return db.query("CALL Delete_working_status(@working_status_Id_ :=?)",[working_status_Id_],callback);
 }
 ,
 Get_working_status:function(working_status_Id_,callback)
 { 
return db.query("CALL Get_working_status(@working_status_Id_ :=?)",[working_status_Id_],callback);
 }
 ,
 Search_working_status:function(working_status_Name_,callback)
 { 
 if (working_status_Name_===undefined || working_status_Name_==="undefined" )
working_status_Name_='';
return db.query("CALL Search_working_status(@working_status_Name_ :=?)",[working_status_Name_],callback);
 }
  };
  module.exports=working_status;

