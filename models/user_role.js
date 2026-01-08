 var db=require('../dbconnection');
 var fs = require('fs');
 var user_role=
 { 
 Save_user_role:function(user_role_,callback)
 { 
return db.query("CALL Save_user_role("+
"@User_Role_Id_ :=?,"+
"@User_Role_Name_ :=?,"+
"@Role_Under_Id_ :=?"+")"
 ,[user_role_.User_Role_Id,
user_role_.User_Role_Name,
user_role_.Role_Under_Id
],callback);
 }
 ,
 Delete_user_role:function(user_role_Id_,callback)
 { 
return db.query("CALL Delete_user_role(@user_role_Id_ :=?)",[user_role_Id_],callback);
 }
 ,
 Get_user_role:function(user_role_Id_,callback)
 { 
return db.query("CALL Get_user_role(@user_role_Id_ :=?)",[user_role_Id_],callback);
 }
 ,
 Search_user_role:function(user_role_Name_,callback)
 { 
 if (user_role_Name_===undefined || user_role_Name_==="undefined" )
user_role_Name_='';
return db.query("CALL Search_user_role(@user_role_Name_ :=?)",[user_role_Name_],callback);
 }
  };
  module.exports=user_role;

