 var db=require('../dbconnection');
 var fs = require('fs');
 var quotation_master=
 { 
 Save_quotation_master:function(quotation_master_,callback)
 { 

  var items_ = JSON.stringify(quotation_master_.items);
  var bill_of_materials_ = JSON.stringify(quotation_master_.bill_of_materials)
  var production_chart_ = JSON.stringify(quotation_master_.production_chart);
  return db.query("CALL Save_quotation_master(" +
    "@Quotation_Master_Id_ :=?, @Customer_Id_ :=?, @PaymentTerms_ :=?, @Payment_Term_Description_ :=?, " +
    "@TotalAmount_ :=?, @Subsidy_Amount_ :=?, @NetTotal_ :=?, @Product_Name_ :=?, @Warranty_ :=?, " +
    "@Terms_And_Conditions_ :=?, @Quotation_Status_Id_ :=?, @Quotation_Status_Name_ :=?, @Created_By_ :=?, " +
    "@Description_ :=?, @items_ :=?, @bill_of_materials_ :=?, @production_chart_ :=?, " +
    "@advance_percentage_ :=?, @onmaterialdelivery_percentage_ :=?, @onWork_completetion_percentage_ :=?, " +
    "@System_Price_Excluding_KSEB_Paperwork_ :=?, @KSEB_Registration_Fees_KW_ :=?, " +
    "@KSEB_Feasibility_Study_Fees_ :=?, @Additional_Structure_Work_ :=?)",
[
    quotation_master_.Quotation_Master_Id,
    quotation_master_.Customer_Id,
    quotation_master_.PaymentTerms,
    quotation_master_.Payment_Term_Description,
    quotation_master_.TotalAmount,
    quotation_master_.Subsidy_Amount,
    quotation_master_.NetTotal,
    quotation_master_.Product_Name,
    quotation_master_.Warranty,
    quotation_master_.Terms_And_Conditions,
    quotation_master_.Quotation_Status_Id,
    quotation_master_.Quotation_Status_Name,
    quotation_master_.Created_By,
    quotation_master_.Description,
    JSON.stringify(quotation_master_.items),
    JSON.stringify(quotation_master_.bill_of_materials),
    JSON.stringify(quotation_master_.production_chart),
    quotation_master_.advance_percentage,
    quotation_master_.onmaterialdelivery_percentage,
    quotation_master_.onWork_completetion_percentage,
    quotation_master_.System_Price_Excluding_KSEB_Paperwork,
    quotation_master_.KSEB_Registration_Fees_KW,
    quotation_master_.KSEB_Feasibility_Study_Fees,
    quotation_master_.Additional_Structure_Work
], callback);

 }
 ,
 Delete_quotation_master:function(quotation_master_Id_,callback)
 { 
return db.query("CALL Delete_quotation_master(@quotation_master_Id_ :=?)",[quotation_master_Id_],callback);
 }
 ,
 Get_quotation_master:function(quotation_master_Id_,callback)
 { 
return db.query("CALL Get_quotation_master(@quotation_master_Id_ :=?)",[quotation_master_Id_],callback);
 }
 ,

   Search_Quotation_Report: function (Quotation_No_, Is_Date_, Fromdate_, Todate_, To_User_Id_, callback) {
     if (Quotation_No_ === undefined || Quotation_No_ === "undefined")
       Quotation_No_ = '';
     return db.query("CALL Search_Quotation_Report(@Quotation_No_ :=?,@Is_Date_ :=?, @Fromdate_ :=?, @Todate_ :=?, @To_User_Id_ :=?)",
       [Quotation_No_, Is_Date_, Fromdate_, Todate_, To_User_Id_], callback);
   },


 Get_Quotation_By_Customer: function (Customer_Id_, Quotation_Status_Id_, callback) {
    return db.query("CALL Get_Quotation_By_Customer(@Customer_Id_ :=?, @Quotation_Status_Id_ :=?)", [Customer_Id_,Quotation_Status_Id_], callback);
},
Search_Quotaion_Report: function (Product_Name_,Is_Date_, Fromdate_, Todate_,Quotation_Status_Id_,User_Details_Id_, callback) {
        if (Product_Name_ === undefined || Product_Name_ === "undefined")
            {
               Product_Name_ = '';
            }else{
               Product_Name_ = Product_Name_.toString();
            }
        return db.query("CALL Search_Quotaion_Report(@Product_Name_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@Quotation_Status_Id_ :=?,@User_Details_Id_ :=?)", [Product_Name_,Is_Date_, Fromdate_, Todate_,Quotation_Status_Id_,User_Details_Id_], callback);
    },
  };
  module.exports=quotation_master;

