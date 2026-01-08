 var db=require('../dbconnection');
 var fs = require('fs');
 var device=
 { 
 Save_device:function(device_,callback)
 { 
return db.query("CALL Save_device("+
"@Device_Id_ :=?,"+
"@Device_Name_ :=?,"+
"@Location_Id_ :=?,"+
"@Location_Name_ :=?,"+
"@ExpiryDate_ :=?,"+
"@Make_ :=?,"+
"@Model_ :=?,"+
"@Serial_No_ :=?,"+
"@Descriptions_ :=?,"+
"@Customer_Id_ :=?"+")"
 ,[device_.Device_Id,
device_.Device_Name,
device_.Location_Id,
device_.Location_Name,
device_.ExpiryDate,
device_.Make,
device_.Model,
device_.Serial_No,
device_.Descriptions,
device_.Customer_Id
],callback);
 }
 ,
 Delete_device:function(device_Id_,callback)
 { 
return db.query("CALL Delete_device(@device_Id_ :=?)",[device_Id_],callback);
 }
 ,
 Get_device:function(device_Id_,callback)
 { 
return db.query("CALL Get_device(@device_Id_ :=?)",[device_Id_],callback);
 }
 ,
 Search_device:function(device_Name_,callback)
 { 
 if (device_Name_===undefined || device_Name_==="undefined" )
device_Name_='';
return db.query("CALL Search_device(@device_Name_ :=?)",[device_Name_],callback);
 }
  };
  module.exports=device;

