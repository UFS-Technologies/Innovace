 var db=require('../dbconnection');
 var fs = require('fs');
 var user_menu_selection=
 { 
     Save_user_menu_selection: function (body, callback) {
        let User_Menu_Selection_ = JSON.stringify(body.User_Menu_Selection)
         return db.query("CALL Save_user_menu_selection(" +
             "@User_Id_ :=?," +
             "@User_Menu_Selection_ :=?" + ")"
             , [body.User_Id, User_Menu_Selection_], callback);
     }
 ,
 Delete_user_menu_selection:function(user_menu_selection_Id_,callback)
 { 
return db.query("CALL Delete_user_menu_selection(@user_menu_selection_Id_ :=?)",[user_menu_selection_Id_],callback);
 }
 ,
 Get_user_menu_selection:function(user_menu_selection_Id_,callback)
 { 
return db.query("CALL Get_user_menu_selection(@user_menu_selection_Id_ :=?)",[user_menu_selection_Id_],callback);
 }
 ,
 Search_user_menu_selection:function(user_menu_selection_Name_,callback)
 { 
 if (user_menu_selection_Name_===undefined || user_menu_selection_Name_==="undefined" )
user_menu_selection_Name_='';
return db.query("CALL Search_user_menu_selection(@user_menu_selection_Name_ :=?)",[user_menu_selection_Name_],callback);
 }
  };
  module.exports=user_menu_selection;

