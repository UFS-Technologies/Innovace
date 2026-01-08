 var db=require('../dbconnection');
 var fs = require('fs');
 var service=
 { 
 Save_service:function(service_,callback)
 { 
return db.query("CALL Save_service("+
"@Service_Id_ :=?,"+
"@Service_No_ :=?,"+
"@Service_Name_ :=?,"+
"@Service_Date_ :=?,"+
"@Service_Type_Id_ :=?,"+
"@Service_Type_Name_ :=?,"+
"@Description_ :=?,"+
"@Assigned_To_ :=?,"+
"@Service_Status_Id_ :=?,"+
"@Service_Status_Name_ :=?,"+
"@Created_By_ :=?,"+
"@Customer_Id_ :=?,"+
"@Amount_ :=?"+
")"
 ,[service_.Service_Id,
service_.Service_No,
service_.Service_Name,
service_.Service_Date,
service_.Service_Type_Id,
service_.Service_Type_Name,
service_.Description,
service_.Assigned_To,
service_.Service_Status_Id,
service_.Service_Status_Name,
service_.Created_By,
service_.Customer_Id,
service_.Amount
],callback);
 }
 ,
 Delete_service:function(service_Id_,callback)
 { 
return db.query("CALL Delete_service(@service_Id_ :=?)",[service_Id_],callback);
 }
 ,
 Get_service:function(service_Id_,callback)
 { 
return db.query("CALL Get_service(@service_Id_ :=?)",[service_Id_],callback);
 }
 ,
 Search_Service_Report:function(service_Name_,Customer_Name_,Service_Status_Id_,Is_Date_,Fromdate_,Todate_,To_User_Id_,callback)
 { 
 if (service_Name_===undefined || service_Name_==="undefined" )
service_Name_='';
 if (Customer_Name_===undefined || Customer_Name_==="undefined" )
  Customer_Name_='';
return db.query("CALL Search_Service_Report(@service_Name_ :=?,@Customer_Name_ :=?,@Service_Status_Id_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@To_User_Id_ :=?)",
  [service_Name_,Customer_Name_,Service_Status_Id_,Is_Date_,Fromdate_,Todate_,To_User_Id_],callback);
 },

 Get_Service_By_Customer: function (Customer_Id_, Service_Type_Id_, Service_Status_Id_, callback) {
    return db.query("CALL Get_Service_By_Customer(@Customer_Id_ :=?, @Service_Type_Id_ :=?, @Service_Status_Id_ :=?)", [Customer_Id_, Service_Type_Id_,Service_Status_Id_], callback);
},

Save_Receipt: function (receipt_, callback) {
     return db.query("CALL Save_Receipt(" +
       "@Receipt_Id_ :=?," +
       "@Entry_Date_ :=?," +
       "@Description_ :=?," +
       "@Amount_ :=?," +
       "@Customer_Id_ :=?," +
       "@By_User_Id_  :=?," +
       "@By_User_Name_ :=?)"
       , [receipt_.Receipt_Id,
        receipt_.Entry_Date,
        receipt_.Description,
        receipt_.Amount,
        receipt_.Customer_Id,
        receipt_.By_User_Id,
        receipt_.By_User_Name
       ], callback);
   },
   Get_Receipt_By_Customer: function (Customer_Id_, callback) {
     return db.query("CALL Get_Receipt_By_Customer(@Customer_Id_ :=?)", [Customer_Id_], callback);
   },
   Delete_Receipt: function (Receipt_Id_, callback) {
     return db.query("CALL Delete_Receipt(@Receipt_Id_ :=?)", [Receipt_Id_], callback);
   },

   Receipt_Report: function (Fromdate_, Todate_,Is_Date_Check_,Customer_Name_, callback) {
        
    return db.query("CALL Receipt_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@Customer_Name_ :=?)", [ Fromdate_, Todate_,Is_Date_Check_,Customer_Name_], callback);
},

Save_Customer_Invoice: function (invoice_, callback) {
  return db.query("CALL Save_Customer_Invoice(" +
      "@customer_invoice_id_ :=?," +
      "@Entry_Date_ :=?," +
      "@Invoice_Description_ :=?," +
      "@Invoice_Amount_ :=?," +
      "@Customer_Id_ :=?," +
      "@By_User_Id_ :=?," +
      "@By_User_Name_ :=?)"
      , [invoice_.customer_invoice_id,
          invoice_.Entry_Date,
          invoice_.Invoice_Description,
          invoice_.Invoice_Amount,
          invoice_.Customer_Id,
          invoice_.By_User_Id,
          invoice_.By_User_Name
      ], callback);
},
Get_Customer_Invoice: function (Customer_Id_, callback) {
  return db.query("CALL Get_Customer_Invoice(@Customer_Id_ :=?)", [Customer_Id_], callback);
},

Invoice_Reciept_Total: function (Customer_Id_, callback) {
  return db.query("CALL Invoice_Reciept_Total(@Customer_Id_ :=?)", [Customer_Id_], callback);
},
// Billing_Payment_Report: function (Customer_Name_,Is_Date_,Fromdate_,Todate_, callback) {
//   return db.query("CALL Billing_Payment_Report(@Customer_Name_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?)", [Customer_Name_,Is_Date_,Fromdate_,Todate_], callback);
// }
  };
  module.exports=service;

