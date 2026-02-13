 var db=require('../dbconnection');
 var fs = require('fs');
 var quotation_master=
 { 
Save_quotation_master: function (quotation_master_, callback) {

  return db.query(
    "CALL Save_quotation_master(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
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

      JSON.stringify(quotation_master_.items || []),
      JSON.stringify(quotation_master_.bill_of_materials || []),
      JSON.stringify(quotation_master_.production_chart || []),

      quotation_master_.advance_percentage,
      quotation_master_.onmaterialdelivery_percentage,
      quotation_master_.onWork_completetion_percentage,
      quotation_master_.advance_amount,
      quotation_master_.advance_remark,
      quotation_master_.onmaterialdelivery_amount,
      quotation_master_.onmaterialdelivery_remark,
      quotation_master_.onWork_completetion_amount,
      quotation_master_.onWork_completetion_remark,

      quotation_master_.System_Price_Excluding_KSEB_Paperwork,
      quotation_master_.KSEB_Registration_Fees_KW,
      quotation_master_.KSEB_Feasibility_Study_Fees,
      quotation_master_.Additional_Structure_Work,
      quotation_master_.TaxableAmount,
      quotation_master_.TotalGSTAmount,
      quotation_master_.TotalGSTPercent,
      quotation_master_.TotalAdCESS,

      quotation_master_.ReferenceNo,
      quotation_master_.ValidUpto,
      quotation_master_.WorkPlace,
      quotation_master_.KindAttn,
      quotation_master_.Subject
    ],
    callback
  );
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

