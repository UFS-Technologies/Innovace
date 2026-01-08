 var db=require('../dbconnection');
 var fs = require('fs');
 var user_type=
 { 
 Save_user_type:function(user_type_,callback)
 { 
return db.query("CALL Save_user_type("+
"@User_Type_Id_ :=?,"+
"@User_Type_Name_ :=?"+")"
 ,[user_type_.User_Type_Id,
user_type_.User_Type_Name
],callback);
 }
 ,
 Delete_user_type:function(user_type_Id_,callback)
 { 
return db.query("CALL Delete_user_type(@user_type_Id_ :=?)",[user_type_Id_],callback);
 }
 ,
 Get_user_type:function(user_type_Id_,callback)
 { 
return db.query("CALL Get_user_type(@user_type_Id_ :=?)",[user_type_Id_],callback);
 }
 ,
 Search_user_type:function(user_type_Name_,callback)
 { 
 if (user_type_Name_===undefined || user_type_Name_==="undefined" )
user_type_Name_='';
return db.query("CALL Search_user_type(@user_type_Name_ :=?)",[user_type_Name_],callback);
 }
  };
  module.exports=user_type;

