 var db=require('../dbconnection');
 var fs = require('fs');
 var quotation_status=
 { 
 Save_quotation_status:function(quotation_status_,callback)
 { 
return db.query("CALL Save_quotation_status("+
"@Quotation_Status_Id_ :=?,"+
"@Quotation_Status_Name_ :=?"+")"
 ,[quotation_status_.Quotation_Status_Id,
quotation_status_.Quotation_Status_Name
],callback);
 }
 ,
 Delete_quotation_status:function(quotation_status_Id_,callback)
 { 
return db.query("CALL Delete_quotation_status(@quotation_status_Id_ :=?)",[quotation_status_Id_],callback);
 }
 ,
 Get_quotation_status:function(quotation_status_Id_,callback)
 { 
return db.query("CALL Get_quotation_status(@quotation_status_Id_ :=?)",[quotation_status_Id_],callback);
 }
 ,
 Search_quotation_status:function(quotation_status_Name_,callback)
 { 
 if (quotation_status_Name_===undefined || quotation_status_Name_==="undefined" )
quotation_status_Name_='';
return db.query("CALL Search_quotation_status(@quotation_status_Name_ :=?)",[quotation_status_Name_],callback);
 }
  };
  module.exports=quotation_status;

