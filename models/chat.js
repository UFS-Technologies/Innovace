 var db=require('../dbconnection');
 var fs = require('fs');
 var chat=
 { 
 Save_chat:function(chat_,callback)
 { 
return db.query("CALL Save_chat("+
"@Chat_Id_ :=?,"+
"@Entered_By_ :=?,"+
"@Customer_Id_ :=?,"+
"@Chat_Messages_ :=?,"+
"@Chat_Date_ :=?,"+
"@Chat_Time_ :=?,"+
"@File_Path_ :=?"+")"
 ,[chat_.Chat_Id,
chat_.Entered_By,
chat_.Customer_Id,
chat_.Chat_Messages,
chat_.Chat_Date,
chat_.Chat_Time,
chat_.File_Path
],callback);
 }
 ,
 Delete_chat:function(chat_Id_,callback)
 { 
return db.query("CALL Delete_chat(@chat_Id_ :=?)",[chat_Id_],callback);
 }
 ,
 Get_chat:function(chat_Id_,callback)
 { 
return db.query("CALL Get_chat(@chat_Id_ :=?)",[chat_Id_],callback);
 }
 ,
 Search_chat:function(chat_Name_,callback)
 { 
 if (chat_Name_===undefined || chat_Name_==="undefined" )
chat_Name_='';
return db.query("CALL Search_chat(@chat_Name_ :=?)",[chat_Name_],callback);
 }
  };
  module.exports=chat;

