 var db=require('../dbconnection');
 var fs = require('fs');
 var menu=
 { 
 Save_menu:function(menu_,callback)
 { 
return db.query("CALL Save_menu("+
"@Menu_Id_ :=?,"+
"@Menu_Name_ :=?,"+
"@Menu_Order_ :=?,"+
"@Menu_Order_Sub_ :=?,"+
"@IsEdit_ :=?,"+
"@IsSave_ :=?,"+
"@IsDelete_ :=?,"+
"@IsView_ :=?,"+
"@Menu_Status_ :=?,"+
"@Menu_Type_ :=?"+")"
 ,[menu_.Menu_Id,
menu_.Menu_Name,
menu_.Menu_Order,
menu_.Menu_Order_Sub,
menu_.IsEdit,
menu_.IsSave,
menu_.IsDelete,
menu_.IsView,
menu_.Menu_Status,
menu_.Menu_Type
],callback);
 }
 ,
 Delete_menu:function(menu_Id_,callback)
 { 
return db.query("CALL Delete_menu(@menu_Id_ :=?)",[menu_Id_],callback);
 }
 ,
 Get_menu:function(menu_Id_,callback)
 { 
return db.query("CALL Get_menu(@menu_Id_ :=?)",[menu_Id_],callback);
 }
 ,
 Search_menu:function(menu_Name_,callback)
 { 
 if (menu_Name_===undefined || menu_Name_==="undefined" )
menu_Name_='';
return db.query("CALL Search_menu(@menu_Name_ :=?)",[menu_Name_],callback);
 }
  };
  module.exports=menu;

