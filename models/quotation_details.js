 var db=require('../dbconnection');
 var fs = require('fs');
 var quotation_details=
 { 
Save_quotation_details: function (items, Quotation_Master_Id, callback) {
    return db.query(
        "CALL Save_quotation_details(?, ?)",
        [JSON.stringify(items), Quotation_Master_Id],
        callback
    );
},
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

