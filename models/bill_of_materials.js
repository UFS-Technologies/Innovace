 var db=require('../dbconnection');
 var fs = require('fs');
 var bill_of_materials=
 { 
 Save_bill_of_materials:function(bill_of_materials_,callback)
 { 
return db.query("CALL Save_bill_of_materials("+
"@Bill_Of_Materials_Id_ :=?,"+
"@Items_And_Description_ :=?,"+
"@make_ :=?,"+
"@Quantity_ :=?,"+
"@Distributor_ :=?,"+
"@Invoice_No_ :=?"+")"
 ,[bill_of_materials_.Bill_Of_Materials_Id,
bill_of_materials_.Items_And_Description,
bill_of_materials_.make,
bill_of_materials_.Quantity,
bill_of_materials_.Distributor,
bill_of_materials_.Invoice_No
],callback);
 }
 ,
 Delete_bill_of_materials:function(bill_of_materials_Id_,callback)
 { 
return db.query("CALL Delete_bill_of_materials(@bill_of_materials_Id_ :=?)",[bill_of_materials_Id_],callback);
 }
 ,
 Get_bill_of_materials:function(bill_of_materials_Id_,callback)
 { 
return db.query("CALL Get_bill_of_materials(@bill_of_materials_Id_ :=?)",[bill_of_materials_Id_],callback);
 }
 ,
 Search_bill_of_materials:function(bill_of_materials_Name_,callback)
 { 
 if (bill_of_materials_Name_===undefined || bill_of_materials_Name_==="undefined" )
bill_of_materials_Name_='';
return db.query("CALL Search_bill_of_materials(@bill_of_materials_Name_ :=?)",[bill_of_materials_Name_],callback);
 }
  };
  module.exports=bill_of_materials;

