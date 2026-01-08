 var db=require('../dbconnection');
 var fs = require('fs');
 var amc=
 { 
 Save_amc:function(amc_,callback)
 { 
return db.query("CALL Save_amc("+
"@AMC_Id_ :=?,"+
"@AMC_No_ :=?,"+
"@Date_ :=?,"+
"@AMC_Status_Id_ :=?,"+
"@AMC_Status_Name_ :=?,"+
"@Product_Name_ :=?,"+
"@Service_Name_ :=?,"+
"@Description_ :=?,"+
"@Amount_ :=?,"+
"@Created_By_ :=?,"+
"@From_Date_ :=?,"+
"@To_Date_ :=?,"+
"@Customer_Id_ :=?"+
")"
 ,[amc_.AMC_Id,
amc_.AMC_No,
amc_.Date,
amc_.AMC_Status_Id,
amc_.AMC_Status_Name,
amc_.Product_Name,
amc_.Service_Name,
amc_.Description,
amc_.Amount,
amc_.Created_By,
amc_.From_Date,
amc_.To_Date,
amc_.Customer_Id

],callback);
 }
 ,
 Delete_amc:function(amc_Id_,callback)
 { 
return db.query("CALL Delete_amc(@amc_Id_ :=?)",[amc_Id_],callback);
 }
 ,
 Get_amc:function(amc_Id_,callback)
 { 
return db.query("CALL Get_amc(@amc_Id_ :=?)",[amc_Id_],callback);
 }
 ,

 Search_AMC_Report:function(Customer_Name_,AMC_Status_Id_,Is_Date_,Fromdate_,Todate_,To_User_Id_,callback)
 { 
 if (Customer_Name_===undefined || Customer_Name_==="undefined" )
  Customer_Name_='';
return db.query("CALL Search_AMC_Report(@Customer_Name_ :=?,@AMC_Status_Id_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?, @To_User_Id_ :=?)",
  [Customer_Name_,AMC_Status_Id_,Is_Date_, Fromdate_, Todate_, To_User_Id_],callback);
 },

 Get_Amc_By_Customer: function (Customer_Id_, AMC_Status_Id_, callback) {
    return db.query("CALL Get_Amc_By_Customer(@Customer_Id_ :=?, @AMC_Status_Id_ :=?)", [Customer_Id_,AMC_Status_Id_], callback);
}
  };
  module.exports=amc;

