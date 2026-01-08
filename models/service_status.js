 var db=require('../dbconnection');
 var fs = require('fs');
 var service_status=
 { 
 Save_service_status:function(service_status_,callback)
 { 
return db.query("CALL Save_service_status("+
"@Service_Status_Id_ :=?,"+
"@Service_Status_Name_ :=?"+")"
 ,[service_status_.Service_Status_Id,
service_status_.Service_Status_Name
],callback);
 }
 ,
 Delete_service_status:function(service_status_Id_,callback)
 { 
return db.query("CALL Delete_service_status(@service_status_Id_ :=?)",[service_status_Id_],callback);
 }
 ,
 Get_service_status:function(service_status_Id_,callback)
 { 
return db.query("CALL Get_service_status(@service_status_Id_ :=?)",[service_status_Id_],callback);
 }
 ,
 Search_service_status:function(service_status_Name_,callback)
 { 
 if (service_status_Name_===undefined || service_status_Name_==="undefined" )
service_status_Name_='';
return db.query("CALL Search_service_status(@service_status_Name_ :=?)",[service_status_Name_],callback);
 }
  };
  module.exports=service_status;

