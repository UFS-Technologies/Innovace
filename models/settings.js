 var db=require('../dbconnection');
 var fs = require('fs');
 var settings=
 { 
 Save_settings:function(settings_,callback)
 { 
return db.query("CALL Save_settings("+
"@Settings_Id_ :=?,"+
"@Quotation_No_ :=?,"+
"@Service_No_ :=?,"+
"@AMC_No_ :=?,"+
"@Payment_Term_ :=?,"+
"@Terms_And_Conditions_ :=?,"+
"@Warranty_ :=?"+")"
 ,[settings_.Settings_Id,
settings_.Quotation_No,
settings_.Service_No,
settings_.AMC_No,
settings_.Payment_Term,
settings_.Terms_And_Conditions,
settings_.Warranty
],callback);
 }
 ,
 Delete_settings:function(settings_Id_,callback)
 { 
return db.query("CALL Delete_settings(@settings_Id_ :=?)",[settings_Id_],callback);
 }
 ,
 Get_settings:function(settings_Id_,callback)
 { 
return db.query("CALL Get_settings(@settings_Id_ :=?)",[settings_Id_],callback);
 }
 ,
 Search_settings:function(settings_Name_,callback)
 { 
 if (settings_Name_===undefined || settings_Name_==="undefined" )
settings_Name_='';
return db.query("CALL Search_settings(@settings_Name_ :=?)",[settings_Name_],callback);
 },
 Save_document_type: function (doc_type_, callback) {
    return db.query("CALL Save_document_type(" +
        "@Document_Type_Id_ :=?," +
        "@Document_Type_Name_ :=?" + ")"
        , [doc_type_.Document_Type_Id,
            doc_type_.Document_Type_Name
        ], callback);
},

Delete_document_type:function(Document_Type_Id_,callback)
 { 
return db.query("CALL Delete_document_type(@Document_Type_Id_ :=?)",[Document_Type_Id_],callback);
 },
 Search_document_type:function(Document_Type_Name_,callback)
 { 
 if (Document_Type_Name_===undefined || Document_Type_Name_==="undefined" )
    Document_Type_Name_='';
return db.query("CALL Search_document_type(@Document_Type_Name_ :=?)",[Document_Type_Name_],callback);
 },
 Save_Company: function (company_, callback) {
    return db.query("CALL Save_Company(" +
        "@Company_Id_ :=?," +
        "@Company_Name_ :=?," + 
        "@Address1_ :=?," + 
        "@Address2_ :=?," + 
        "@Address3_ :=?," + 
        "@Address4_ :=?," + 
        "@Mobile_Number_ :=?," + 
        "@Phone_Number_ :=?," + 
        "@Email_ :=?," + 
        "@Website_ :=?," + 
        "@Logo_ :=?," + 
        "@Gst_No_ :=?," + 
        "@Pan_No_ :=?," + 
        "@Is_Location_ :=?" + 
        ")"
        , [company_.Company_Id,
           company_.Company_Name,
           company_.Address1,
           company_.Address2,
           company_.Address3,
           company_.Address4,
           company_.Mobile_Number,
           company_.Phone_Number,
           company_.Email,
           company_.Website,
           company_.Logo,
           company_.Gst_No,
           company_.Pan_No,
           company_.Is_Location
        ], callback);
},
Save_custom_field: function (custom_field_, callback) {
    console.log("Saving custom field:", custom_field_);

    const dropdownJson = 
        custom_field_.custom_field_type_id === 3 && Array.isArray(custom_field_.Dropdown_Values)
        ? JSON.stringify(custom_field_.Dropdown_Values)
        : '[]';

    const checkboxJson = 
        custom_field_.custom_field_type_id === 5 && Array.isArray(custom_field_.Checkbox_Values)
        ? JSON.stringify(custom_field_.Checkbox_Values)
        : '[]';

    console.log("Calling with params:", [
      custom_field_.custom_field_id,
      custom_field_.custom_field_type_id,
      custom_field_.custom_field_name,
      dropdownJson,
      checkboxJson
    ]);

    return db.query(
        "CALL Save_custom_field(?, ?, ?, ?, ?)",
        [
            custom_field_.custom_field_id,
            custom_field_.custom_field_type_id,
            custom_field_.custom_field_name,
            dropdownJson,
            checkboxJson
        ],
        callback
    );
}

,
Delete_custom_field: function (custom_field_Id_, callback) {
    return db.query("CALL Delete_custom_field(@Custom_Field_Id_ := ?)", [custom_field_Id_], callback);
},
Get_All_custom_field:function(callback)
 { 
return db.query("CALL Get_All_custom_field()",[],callback);
 }
 ,
Get_Company_Details:function(callback)
 { 
return db.query("CALL Get_Company_Details()",[],callback);
 }
 ,
 Get_custom_field_type:function(callback)
 { 
return db.query("CALL Get_custom_field_type()",[],callback);
 }
 ,
  };
  module.exports=settings;

