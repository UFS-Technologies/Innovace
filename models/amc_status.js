 var db=require('../dbconnection');
 var fs = require('fs');
 var amc_status=
 { 
 Save_amc_status:function(amc_status_,callback)
 { 
return db.query("CALL Save_amc_status("+
"@AMC_Status_Id_ :=?,"+
"@AMC_Status_Name_ :=?"+")"
 ,[amc_status_.AMC_Status_Id,
amc_status_.AMC_Status_Name
],callback);
 }
 ,
 Delete_amc_status:function(amc_status_Id_,callback)
 { 
return db.query("CALL Delete_amc_status(@amc_status_Id_ :=?)",[amc_status_Id_],callback);
 }
 ,
 Get_amc_status:function(amc_status_Id_,callback)
 { 
return db.query("CALL Get_amc_status(@amc_status_Id_ :=?)",[amc_status_Id_],callback);
 }
 ,
 Search_amc_status:function(amc_status_Name_,callback)
 { 
 if (amc_status_Name_===undefined || amc_status_Name_==="undefined" )
amc_status_Name_='';
return db.query("CALL Search_amc_status(@amc_status_Name_ :=?)",[amc_status_Name_],callback);
 }
  };
  module.exports=amc_status;

