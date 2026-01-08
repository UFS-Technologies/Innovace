 var db=require('../dbconnection');
 var fs = require('fs');
 var remarks=
 { 
 Save_remarks:function(remarks_,callback)
 { 
return db.query("CALL Save_remarks("+
"@Remarks_Id_ :=?,"+
"@Remarks_Name_ :=?"+")"
 ,[remarks_.Remarks_Id,
remarks_.Remarks_Name
],callback);
 }
 ,
 Delete_remarks:function(remarks_Id_,callback)
 { 
return db.query("CALL Delete_remarks(@remarks_Id_ :=?)",[remarks_Id_],callback);
 }
 ,
 Get_remarks:function(remarks_Id_,callback)
 { 
return db.query("CALL Get_remarks(@remarks_Id_ :=?)",[remarks_Id_],callback);
 }
 ,
 Search_remarks:function(remarks_Name_,callback)
 { 
 if (remarks_Name_===undefined || remarks_Name_==="undefined" )
remarks_Name_='';
return db.query("CALL Search_remarks(@remarks_Name_ :=?)",[remarks_Name_],callback);
 }
  };
  module.exports=remarks;

