 var db=require('../dbconnection');
 var fs = require('fs');
 var quotation_details=
 { 
 Save_quotation_details:function(quotation_details_,callback)
 { 
return db.query("CALL Save_quotation_details("+
"@Quotation_Details_Id_ :=?,"+
"@Quotation_Master_Id_ :=?,"+
"@ItemName_ :=?,"+
"@UnitPrice_ :=?,"+
"@Quantity_ :=?,"+
"@Amount_ :=?"+")"
 ,[quotation_details_.Quotation_Details_Id,
quotation_details_.Quotation_Master_Id,
quotation_details_.ItemName,
quotation_details_.UnitPrice,
quotation_details_.Quantity,
quotation_details_.Amount
],callback);
 }
 ,
 Delete_quotation_details:function(quotation_details_Id_,callback)
 { 
return db.query("CALL Delete_quotation_details(@quotation_details_Id_ :=?)",[quotation_details_Id_],callback);
 }
 ,
 Get_quotation_details:function(quotation_details_Id_,callback)
 { 
return db.query("CALL Get_quotation_details(@quotation_details_Id_ :=?)",[quotation_details_Id_],callback);
 }
 ,
 Search_quotation_details:function(quotation_details_Name_,callback)
 { 
 if (quotation_details_Name_===undefined || quotation_details_Name_==="undefined" )
quotation_details_Name_='';
return db.query("CALL Search_quotation_details(@quotation_details_Name_ :=?)",[quotation_details_Name_],callback);
 }
  };
  module.exports=quotation_details;

