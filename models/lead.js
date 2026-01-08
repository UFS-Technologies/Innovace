var db = require("../dbconnection");
var fs = require("fs");
const uuid = require("uuid");
var lead = {
  Save_lead: function (lead_, followup_, User_Details_Id,customFields_, enquiryForCustomFields_, callback) {
    console.log("lead_: ", lead_);
    console.log("followup_: ", followup_);
  console.log("customFields_: ", customFields_);
    let FollowUp_Value_ = 0;

    if (
      followup_ !== undefined &&
      followup_ !== "" &&
      followup_ !== null &&
      lead_.Customer_Id === 0
    ) {
      FollowUp_Value_ = 1;
         
      // Add custom fields to followup data if they exist
      let transformedCustomFields = null;
      if (customFields_ && Array.isArray(customFields_) && customFields_.length > 0) {
        transformedCustomFields = customFields_.map(field => ({
          customefieldid: field.custom_field_id,  // Map to expected field name
          datavalue: field.value                   // Map to expected field name
        }));

        let transformedenquiryCustomFields = null;
      if (enquiryForCustomFields_ && Array.isArray(enquiryForCustomFields_) && enquiryForCustomFields_.length > 0) {
        transformedenquiryCustomFields = enquiryForCustomFields_.map(field => ({
          custom_field_id: field.custom_field_id,  // Map to expected field name
          value: field.value                   // Map to expected field name
        }));

      }
        console.log("Transformed customFields:", transformedCustomFields);        // Add transformed custom fields to followup data
        followup_.CustomFields = transformedCustomFields;
      }

    } else {
      FollowUp_Value_ = 0;
      followup_ = {
        Next_FollowUp_date: "",
        Status_Id: 0,
        Status_Name: "",
        By_User_Id: User_Details_Id,
        By_User_Name: "",
        To_User_Id: 0,
        To_User_Name: "",
        FollowUp: 0,
        Remark: "",
        Branch_Id: 0,
        Branch_Name: "",
        Department_Id: 0,
        Department_Name: "",
        Stage_Id:0,
        Stage_Name:"",
        Percentage:0.00
      };
    }

    console.log("followup_: ", followup_);

    const sqlQuery = `
        CALL Save_lead(
            @Customer_Id_ := ?,
            @Customer_Name_ := ?,
            @Address_ := ?,
            @Email_Address_ := ?,
            @Phone_Number_ := ?,
            @Location_ := ?,
            @Consumer_Number_ := ?,
            @Electrical_Section_ := ?,
            @Inverter_Capacity_ := ?,
            @Inverter_Type_Id_ := ?,
            @Inverter_Type_Name_ := ?,
            @Panel_Capacity_ := ?,
            @Panel_Type_Id_ := ?,
            @Panel_Type_Name_ := ?,
            @Phase_Id_ := ?,
            @Phase_Name_ := ?,
            @Roof_Type_Id_ := ?,
            @Roof_Type_Name_ := ?,
            @Project_Cost_ := ?,
            @Additional_Cost_ := ?,
            @Advance_Amount_ := ?,
            @Amount_Paid_Through_Id_ := ?,
            @Amount_Paid_Through_Name_ := ?,
            @UPI_Transfer_Photo_ := ?,
            @Cost_Includes_Id_ := ?,
            @Cost_Includes_Name_ := ?,
            @Electricity_Bill_Photo_ := ?,
            @Cancelled_Cheque_Passbook_ := ?,
            @Adhaar_Card_Back_ := ?,
            @Passport_Size_Photo_ := ?,
            @Connected_Load_ := ?,
            @Rep_ := ?,
            @Lead_By_ := ?,
            @Work_Type_Id_ := ?,
            @Work_Type_Name_ := ?,
            @Subsidy_Type_Id_ := ?,
            @Subsidy_Type_Name_ := ?,
            @Additional_Comments_ := ?,
            @Branch_Id_ := ?,
            @Total_Task_ := ?,
            @Completed_Task_ := ?,
            @FollowUp_ := ?,
            @FollowUp_Value_ := ?,
            @Enquiry_For_Id_ := ?,
            @Enquiry_For_Name_ := ?,
            @Enquiry_Source_Id_ := ?,
            @Enquiry_Source_Name_ := ?,
            @Login_userId_ := ?,
            @Maplink_ := ?,
            @Latitude_ := ?,
            @Longitude_ := ?,
            @City_ := ?,
            @District_ := ?,
            @District_Id_ := ?,
            @State_ := ?,
            @Pincode_ := ?,
            @Reference_Name_ := ?,
            @Source_Category_Id_ := ?,
            @Source_Category_Name_ := ?,
            @Project_Engineer_Id_ := ?,
            @Project_Engineer_Name_ := ?,
            @Percentage_ := ?,
            @Deal_State_Id_ := ?,
            @Deal_State_Name_ := ?,
             @Lead_Type_Id_ :=?,
  @Lead_Type_Name_ :=?,
    @Age_ :=?,
      @PE_Id_ :=?,
        @PE_Name_ :=?,
          @CRE_Id_ :=?,
            @CRE_Name_ :=?,
            @Custom_Fields_ :=?,
      @enquiryForCustomFields_ := ?,
      @City_Id_ := ?,
       @City_Name_ := ?,
        @Fire_Station_Id_ := ?,
         @Fire_Station_Name_ := ?,
         @Engineers_Id_ := ?,
      @Engineer_Name_ := ?,
      @Customer_Master_Id_ :=?


       )
    `;
   // Prepare customFields for the stored procedure
    // The Save_lead procedure expects customFields as a separate parameter
    let customFieldsForProcedure = null;
    if (customFields_ && Array.isArray(customFields_) && customFields_.length > 0) {
        // Transform to match stored procedure expectations
        const transformedFields = customFields_.map(field => ({
            customefieldid: field.custom_field_id,
            datavalue: field.value
        }));
        customFieldsForProcedure = JSON.stringify(transformedFields);
        console.log("customFieldsForProcedure JSON:", customFieldsForProcedure);
    }

    let enquirycustomFieldsForProcedure = null;
    if (enquiryForCustomFields_ && Array.isArray(enquiryForCustomFields_) && enquiryForCustomFields_.length > 0) {
        // Transform to match stored procedure expectations
        const transformedFields = enquiryForCustomFields_.map(field => ({
           custom_field_id: field.custom_field_id,  // Map to expected field name
          value: field.value  
        }));
        enquirycustomFieldsForProcedure = JSON.stringify(transformedFields);
        console.log("enquirycustomFieldsForProcedure JSON:", enquirycustomFieldsForProcedure);
    }

    const parameters = [
      lead_.Customer_Id,
      lead_.Customer_Name,
      lead_.Address,
      lead_.Email_Address,
      lead_.Phone_Number,
      lead_.Location,
      lead_.Consumer_Number,
      lead_.Electrical_Section,
      lead_.Inverter_Capacity,
      lead_.Inverter_Type_Id,
      lead_.inverter_type_name,
      lead_.Panel_Capacity,
      lead_.Panel_Type_Id,
      lead_.panel_type_name,
      lead_.Phase_Id,
      lead_.phase_name,
      lead_.Roof_Type_Id,
      lead_.roof_type_name,
      lead_.Project_Cost,
      lead_.Additional_Cost,
      lead_.Advance_Amount,
      lead_.Amount_Paid_Through_Id,
      lead_.amount_paid_through_name,
      lead_.UPI_Transfer_Photo,
      lead_.Cost_Includes_Id,
      lead_.cost_includes_name,
      lead_.Electricity_Bill_Photo,
      lead_.Cancelled_Cheque_Passbook,
      lead_.Adhaar_Card_Back,
      lead_.Passport_Size_Photo,
      lead_.Connected_Load,
      lead_.Rep,
      lead_.Lead_By,
      lead_.Work_Type_Id,
      lead_.work_type_name,
      lead_.Subsidy_Type_Id,
      lead_.subsidy_type_name,
      lead_.Additional_Comments,
      lead_.Branch_Id,
      lead_.Total_Task,
      lead_.Completed_Task,
      JSON.stringify(followup_),
      FollowUp_Value_,
      lead_.Enquiry_For_Id,
      lead_.Enquiry_For_Name,
      lead_.Enquiry_Source_Id,
      lead_.Enquiry_Source_Name,
      User_Details_Id,
      lead_.Maplink,
      lead_.Latitude,
      lead_.Longitude,
      lead_.City,
      lead_.District,
      lead_.District_Id,
      lead_.State,
      lead_.Pincode,
      lead_.Reference_Name,
      lead_.Source_Category_Id,
      lead_.Source_Category_Name,
      lead_.Project_Engineer_Id,
      lead_.Project_Engineer_Name,
      // lead_.Appointment_Date,
      // lead_.Site_Visit,
      // lead_.Quote_Provided_To_Customer,
      // lead_.Revisit_Done,
      lead_.Percentage,
      lead_.Deal_State_Id,
      lead_.Deal_State_Name,
          lead_.Lead_Type_Id,
      lead_.Lead_Type_Name,
      lead_.Age,
      lead_.PE_Id,
lead_.PE_Name,
lead_.CRE_Id,
lead_.CRE_Name,
       customFieldsForProcedure,
       enquirycustomFieldsForProcedure,
         lead_.City_Id,
          lead_.City_Name,
           lead_.Fire_Station_Id, 
           lead_.Fire_Station_Name,
           lead_.Engineers_Id,
          lead_.Engineer_Name,
          lead_.Customer_Master_Id



    ];

    return db.query(sqlQuery, parameters, callback);
  },

  Delete_lead: function (lead_Id_, callback) {
    return db.query("CALL Delete_lead(@lead_Id_ := ?)", [lead_Id_], callback);
  },

  Get_lead: function (Customer_Id_, callback) {
    return db.query(
      "CALL Get_lead(@Customer_Id_ :=?)",
      [Customer_Id_],
      callback
    );
  },
 Get_City_Fire_Station_by_DistrictId: function (District_Id_, callback) {
  return db.query(
    "CALL Get_City_Fire_Station_by_DistrictId(?)",
    [District_Id_],
    callback
  );
},


  Get_Lead_Report_By_Enquiry_Source: function (
    from_date,
    to_date,
    User_Details_Id,
    callback
  ) {
    return db.query(
      "CALL Get_Lead_Report_By_Enquiry_Source(?, ?,?)",
      [from_date, to_date, User_Details_Id],
      callback
    );
  },

  Search_lead: function (
    Customer_Name_,
    Is_Date_,
    Fromdate_,
    Todate_,
    To_User_Id_,
    Login_User_Id_,
    Status_Id_,
    Page_Index1_,
    Page_Index2_,
    Enquiry_For_Id_,
    User_Details_Id_,
    callback
  ) {
    Customer_Name_ =
      Customer_Name_ && Customer_Name_ !== "undefined"
        ? Customer_Name_.toString()
        : "";
    Fromdate_ =
      Fromdate_ && Fromdate_ !== "undefined" ? Fromdate_ : "1900-01-01";
    Todate_ = Todate_ && Todate_ !== "undefined" ? Todate_ : "2100-01-01";
    To_User_Id_ = To_User_Id_ ?? 0;
    Login_User_Id_ = Login_User_Id_ ?? 0;
    Status_Id_ = Status_Id_ ?? 0;
    Page_Index1_ = Page_Index1_ ?? 1;
    Page_Index2_ = Page_Index2_ ?? 25;
    Enquiry_For_Id_ = Enquiry_For_Id_ ?? 0;
    User_Details_Id_ = User_Details_Id_ ?? 0;

    console.log("Customer_Name_: ", Customer_Name_);
    console.log("Fromdate,", Fromdate_);
    console.log("To_Date", Todate_);

    return db.query(
      "CALL Search_lead(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [
        Customer_Name_,
        Is_Date_,
        Fromdate_,
        Todate_,
        To_User_Id_,
        Login_User_Id_,
        Status_Id_,
        Page_Index1_,
        Page_Index2_,
        Enquiry_For_Id_,
        User_Details_Id_,
      ],
      callback
    );
  },

  Search_Enquiry_Source: function (Enquiry_Source_Name_, callback) {
    if (
      Enquiry_Source_Name_ === undefined ||
      Enquiry_Source_Name_ === "undefined"
    )
      Enquiry_Source_Name_ = "";
    return db.query(
      "CALL Search_Enquiry_Source(@Enquiry_Source_Name_ :=?)",
      [Enquiry_Source_Name_],
      callback
    );
  },

  Get_FollowUp_History: function (Customer_Id_, callback) {
    return db.query(
      "CALL Get_FollowUp_History(?)",
      [Customer_Id_],
      callback
    );
  },
  Search_Customer: function (
    Customer_Name_,
    Is_Date_,
    Fromdate_,
    Todate_,
    To_User_Id_,
    Status_Id_,
    Page_Index1_,
    Page_Index2_,
    User_Details_Id_,
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined")
      Customer_Name_ = "";

    return db.query(
      "CALL Search_Customer(?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [
        Customer_Name_,
        Is_Date_,
        Fromdate_,
        Todate_,
        To_User_Id_,
        Status_Id_,
        Page_Index1_,
        Page_Index2_,
        User_Details_Id_,
      ],
      callback
    );
  },
  Search_lead_Report: function (
    Customer_Name_,
    Is_Date_,
    Fromdate_,
    Todate_,
    To_User_Id_,
    Status_Id_,
    User_Details_Id_,
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined") {
      Customer_Name_ = "";
    } else {
      Customer_Name_ = Customer_Name_.toString();
    }
    return db.query(
      "CALL Search_lead_Report(@Customer_Name_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@To_User_Id_ :=?,@Status_Id_ :=?,@User_Details_Id_ :=?)",
      [
        Customer_Name_,
        Is_Date_,
        Fromdate_,
        Todate_,
        To_User_Id_,
        Status_Id_,
        User_Details_Id_,
      ],
      callback
    );
  },

  Search_Pending_Followup_Report: function (
    Customer_Name_,
    Is_Date_,
    Fromdate_,
    Todate_,
    To_User_Id_,
    Status_Id_,
    User_Details_Id_,
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined") {
      Customer_Name_ = "";
    } else {
      Customer_Name_ = Customer_Name_.toString();
    }
    return db.query(
      "CALL Search_Pending_Followup_Report(@Customer_Name_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@To_User_Id_ :=?,@Status_Id_ :=?,@User_Details_Id_ :=?)",
      [
        Customer_Name_,
        Is_Date_,
        Fromdate_,
        Todate_,
        To_User_Id_,
        Status_Id_,
        User_Details_Id_,
      ],
      callback
    );
  },

  Search_Warranty_Report: function (
    Customer_Name_,
    Is_Date_,
    Fromdate_,
    Todate_,
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined") {
      Customer_Name_ = "";
    } else {
      Customer_Name_ = Customer_Name_.toString();
    }

    return db.query(
      "CALL Search_Warranty_Report(@Customer_Name_ :=?,@Is_Date_ :=?, @Fromdate_ :=?, @Todate_ :=?)",
      [Customer_Name_, Is_Date_, Fromdate_, Todate_],
      callback
    );
  },

  Get_Dashboard_Count: function (
    Login_User_Id_,
    Fromdate_,
    Todate_,
    Is_Date_,
    callback
  ) {
    return db.query(
      "CALL Get_Dashboard_Count(@Login_User_Id_ :=?,@Fromdate_ :=?,@Todate_ :=?,@Is_Date_ :=?)",
      [Login_User_Id_, Fromdate_, Todate_, Is_Date_],
      callback
    );
  },
  Enquiry_Source_Conversion_Report: function (
    User_Details_Id,
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    callback
  ) {
    console.log(User_Details_Id);
    return db.query(
      "CALL Enquiry_Source_Conversion_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@User_Details_Id_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_, User_Details_Id],
      callback
    );
  },
  Enquiry_Source_Summary_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    callback
  ) {
    return db.query(
      "CALL Enquiry_Source_Summary_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_],
      callback
    );
  },

  Lead_Progress_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    User_Details_Id,
    callback
  ) {
    return db.query(
      "CALL Lead_Progress_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@User_Details_Id_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_, User_Details_Id],
      callback
    );
  },

  Customer_Work_Summary: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    User_Details_Id,
    callback
  ) {
    return db.query(
      "CALL Customer_Work_Summary(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@User_Details_Id_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_, User_Details_Id],
      callback
    );
  },

  Enquiry_For_Report: function (Fromdate_, Todate_, Is_Date_Check_, callback) {
    return db.query(
      "CALL Enquiry_For_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_],
      callback
    );
  },

  Conversion_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    Enquiry_For_Id_,
    Registered_By_,
    Customer_Name_,
    Status_Id_,
    User_Details_Id,
    callback
  ) {
    console.log(User_Details_Id);
    return db.query(
      "CALL Conversion_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@Enquiry_For_Id_ :=?,@Registered_By_ :=?,@Customer_Name_ :=?,@Status_Id_ :=?,@User_Details_Id_ :=?)",
      [
        Fromdate_,
        Todate_,
        Is_Date_Check_,
        Enquiry_For_Id_,
        Registered_By_,
        Customer_Name_,
        Status_Id_,
        User_Details_Id,
      ],
      callback
    );
  },

  Update_Customer: function (lead_, callback) {
    return db.query(
      "CALL Update_Customer(" +
        "@Customer_Id_ :=?," +
        "@Customer_Name_ :=?," +
        "@Contact_Number_ :=?," +
        "@Email_ :=?," +
        "@Address1_ :=?," +
        "@Address2_ :=?," +
        "@Address3_ :=?," +
        "@Address4_ :=?," +
        "@Map_Link_ :=?," +
        "@Pincode_ :=?" +
        ")",
      [
        lead_.Customer_Id,
        lead_.Customer_Name,
        lead_.Contact_Number,
        lead_.Email,
        lead_.Address1,
        lead_.Address2,
        lead_.Address3,
        lead_.Address4,
        lead_.Map_Link,
        lead_.Pincode,
      ],
      callback
    );
  },
  Get_Engineer_Enquiry_Source: function(callback) {
        return db.query("CALL Get_Engineer_Enquiry_Source()", callback);
    },

  Save_Enquiry_Source: function (enquiry_source_, callback) {
    return db.query(
      "CALL Save_Enquiry_Source(?,?,?,?)",
       // "@Source_Category_Id_ :=?," +
        //"@Source_Category_Name_ :=?" +
        
      [
        enquiry_source_.Enquiry_Source_Id,
        enquiry_source_.Enquiry_Source_Name,
        JSON.stringify(enquiry_source_.Custom_Fields),
        enquiry_source_.Engineer
      ],
      callback
    );
  },

  Delete_Enquiry_Source: function (Enquiry_Source_Id_, callback) {
    return db.query(
      "CALL Delete_Enquiry_Source(@Enquiry_Source_Id_ :=?)",
      [Enquiry_Source_Id_],
      callback
    );
  },

  Search_Enquiry_For: function (Enquiry_For_Name_, callback) {
    if (Enquiry_For_Name_ === undefined || Enquiry_For_Name_ === "undefined")
      Enquiry_For_Name_ = "";
    return db.query(
      "CALL Search_Enquiry_For(@Enquiry_For_Name_ :=?)",
      [Enquiry_For_Name_],
      callback
    );
  },

  Search_Checklist: function (Checklist_Name_, callback) {
    if (Checklist_Name_ === undefined || Checklist_Name_ === "undefined")
      Checklist_Name_ = "";
    return db.query(
      "CALL Search_Checklist(@Checklist_Name_ :=?)",
      [Checklist_Name_],
      callback
    );
  },
  Save_Enquiry_For: function (enquiry_for_, callback) {
    let customFields = enquiry_for_.Custom_Fields || [];

    // ✅ Automatically add Order_By index if not provided
    customFields = customFields.map((field, index) => ({
        ...field,
        Order_By: field.Order_By || index + 1
    }));

    return db.query(
    
      "CALL Save_Enquiry_For(?, ?, ?, ?, ?)",
    
      [enquiry_for_.Enquiry_For_Id, enquiry_for_.Enquiry_For_Name,enquiry_for_.Source_Category_Id,
        enquiry_for_.Source_Category_Name,JSON.stringify(enquiry_for_.Custom_Fields)],
      callback
    );
  },

  Save_Checklist: function (checklist_, callback) {
    return db.query(
      "CALL Save_Checklist(" +
        "@Checklist_Id_ :=?," +
        "@Checklist_Name_ :=?" +
        ")",
      [checklist_.Checklist_Id, checklist_.Checklist_Name],
      callback
    );
  },

  Delete_Enquiry_For: function (Enquiry_For_Id_, callback) {
    return db.query(
      "CALL Delete_Enquiry_For(@Enquiry_For_Id_ :=?)",
      [Enquiry_For_Id_],
      callback
    );
  },
  Delete_Checklist: function (Checklist_Id_, callback) {
    return db.query(
      "CALL Delete_Checklist(@Checklist_Id_ :=?)",
      [Checklist_Id_],
      callback
    );
  },
  Search_Invoice_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    Customer_Name_,
    callback
  ) {
    return db.query(
      "CALL Search_Invoice_Report(@Fromdate_ := ?, @Todate_ := ?, @Is_Date_Check_ := ?, @Customer_Name_ := ?)",
      [Fromdate_, Todate_, Is_Date_Check_, Customer_Name_],
      callback
    );
  },


  Search_Receipt_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    Customer_Name_,
    callback
  ) {
    if ((Customer_Name_ === undefined) | (Customer_Name_ === null))
      Customer_Name_ = "";
    return db.query(
      "CALL Search_Receipt_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@Customer_Name_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_, Customer_Name_],
      callback
    );
  },

  Search_Feasibility_Report: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    callback
  ) {
    return db.query(
      "CALL Search_Feasibility_Report(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_],
      callback
    );
  },

  Task_Allocation_Summary: function (
    Fromdate_,
    Todate_,
    Is_Date_Check_,
    User_Details_Id_,
    callback
  ) {
    return db.query(
      "CALL Task_Allocation_Summary(@Fromdate_ :=?,@Todate_ :=?,@Is_Date_Check_ :=?,@User_Details_Id_ :=?)",
      [Fromdate_, Todate_, Is_Date_Check_, User_Details_Id_],
      callback
    );
  },
  Import_Engineer: function (data, callback) {
    console.log("Engineer Import data: ", data);
    return db.query(
  "CALL Engineer_Import(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
  [
    JSON.stringify(data.Engineer_Details),
    data.By_User_Id,
    data.By_User_Name,
    data.Status,
    data.Status_Name,
    data.To_User,
    data.To_User_Name,
    data.Enquiry_Source,
    data.Enquiry_Source_Name,
    data.Next_FollowUp_Date,
    data.Status_FollowUp,
    data.Remark,
    data.Enquiry_For_Id,
    data.Enquiry_For_Name
  ],
  callback
);

},


  Lead_Import: function (data, callback) {
    console.log("data: ", data);
    return db.query(
      "CALL Lead_Import(@Lead_Details_ :=?,@By_User_Id_ :=?,@Status_ :=?,@To_User_ :=?,@Enquiry_Source_ :=?,@Next_FollowUp_Date_ :=?,@Status_Name_ :=?,@Enquiry_Source_Name_ :=?,@To_User_Name_ :=?,@By_User_Name_ :=?,@Status_FollowUp_ :=?,@Remark_ :=?,@Enquiry_For_Id_ :=?,@Enquiry_For_Name_ :=?)",
      [
        JSON.stringify(data.Lead_Details),
        data.By_User_Id,
        data.Status,
        data.To_User,
        data.Enquiry_Source,
        data.Next_FollowUp_Date,
        data.Status_Name,
        data.Enquiry_Source_Name,
        data.To_User_Name,
        data.By_User_Name,
        data.Status_FollowUp,
        data.Remark,
        data.Enquiry_For_Id,
        data.Enquiry_For_Name,
      ],
      callback
    );
  },

  Save_Image: function (data, By_User_, callback) {
    console.log("data: ", data);
    return db.query(
      "CALL Save_Image(@Images_Id_ :=?,@Customer_Id_ :=?,@Document_Type_Id_ :=?,@File_Paths_ :=?,@By_User_ :=?)",
      [
        data.Images_Id,
        data.Customer_Id,
        data.Document_Type_Id,
        JSON.stringify(data.File_Paths),
        By_User_,
      ],
      callback
    );
  },

  Delete_image: function (Images_Id_, callback) {
    return db.query(
      "CALL Delete_image(@Images_Id_ :=?)",
      [Images_Id_],
      callback
    );
  },
  Get_Images_By_Customer: function (Customer_Id_, callback) {
    return db.query(
      "CALL Get_Images_By_Customer(@Customer_Id_ :=?)",
      [Customer_Id_],
      callback
    );
  },

  Remove_Registration: function (Customer_Id_, callback) {
    return db.query(
      "CALL Remove_Registration(@Customer_Id_ :=?)",
      [Customer_Id_],
      callback
    );
  },

  Get_Lead_Dropdown: function (callback) {
    return db.query("CALL Get_Lead_Dropdown()", callback);
  },
  // Get_Organization: function (callback) {
  //   return db.query("CALL Get_Organization()", callback);
  // },
Save_customer_master: function (data, callback) {
    // If an array is sent, use the first object
    const dataObj = Array.isArray(data) ? data[0] : data;

    // Prepare parameters for the stored procedure
    const params = [
        dataObj.customer_master_id || 0,         // 0 for new record, >0 for update
        dataObj.customer_master_name || '',
        dataObj.address1 || '',
        dataObj.phone_number || '',
        dataObj.email || '',
        dataObj.Whatsapp_Number || ''            // New field
    ];

    console.log("SP Parameters:", params);

    return db.query('CALL Save_Customer_Master(?, ?, ?, ?, ?, ?)', params, callback);
},


  Get_customer_master: function(callback) {
    return db.query('CALL Get_customer_master()', callback);
  },
  Search_customer_master: function (data, callback) {
  const name = data.customer_master_name || '';
  const phone = data.phone_number || '';

  return db.query('CALL Search_Customer_Master(?, ?)', [name, phone], callback);
},
Delete_customer_master: function(customer_master_id, callback) {
  return db.query('CALL Delete_Customer_Master(?)', [customer_master_id], callback);
},
Get_Engineer_Department: function (Engineer_Department_Name_, callback) {
    if (
        Engineer_Department_Name_ === undefined ||
        Engineer_Department_Name_ === "undefined"
    ) {
        Engineer_Department_Name_ = '';
    }

    return db.query(
        "CALL Get_Engineer_Department(@Engineer_Department_Name_ :=?)",
        [Engineer_Department_Name_],
        callback
    );
},


Get_engineer_details: function (
  Search_,
  District_Id_,
  Department_Id_,
  Association_Name_,
  Page_Index1_,
  Page_Index2_,
  callback
) {
  Search_ = Search_ || '';
  District_Id_ = District_Id_ || 0;
  Department_Id_ = Department_Id_ || 0;
  Association_Name_ = Association_Name_ || '';
  Page_Index1_ = Page_Index1_ ?? 1;
  Page_Index2_ = Page_Index2_ ?? 25;

  return db.query(
    "CALL Get_engineer_details(?, ?, ?, ?, ?, ?)",
    [
      Search_,
      District_Id_,
      Department_Id_,
      Association_Name_,
      Page_Index1_,
      Page_Index2_
    ],
    callback
  );
},





  Search_engineers: function(filters, callback) {
        const statusId = filters.Status_Id || null;
        const fromDate = filters.From_Date || null;
        const toDate = filters.To_Date || null;
        const toStaffId = filters.To_Staff_Id || null; // <- corrected
        const engineerNamePhone = filters.Engineer_Name_Phone || null;
        const pageStart = filters.Page_Start || 1;
        const pageEnd = filters.Page_End || 10;

        const sqlQuery = "CALL Search_Engineers(?, ?, ?, ?, ?, ?, ?)";
        const params = [statusId, fromDate, toDate, toStaffId, engineerNamePhone, pageStart, pageEnd];

        console.log("Executing SP with params:", params);

        return db.query(sqlQuery, params, callback);
    },

  //  Get_Association: function(callback) {
  //   return db.query('CALL Get_Association()', callback);
  // },
Save_engineers: function (data, callback) {
    const sqlQuery = `
        CALL Save_engineers(
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
        )
    `;

    // Prepare parameters in the exact order as SP
    const parameters = [
    data.Engineers_Id || 0,         // Engineers_Id
    data.Engineer_Name,              // Engineer_Name
    data.Phone_No,                   // Phone_No
    data.Organization_Name,          // Organization_Name
    data.District_Id,                // District_Id
    data.District_Name, 
     data.City_Id,          // ✅ NEW
    data.City_Name,               // District_Name
    data.Association_Name,           // Association_Name
    data.WhatsApp_Number || null,    // WhatsApp_Number
    data.Email || null,              // Email
    data.Department_Id || null,      // Department_Id
    data.Department_Name || null,    // Department_Name
    data.User_Id                     // User_Id
];

    console.log("Executing Save_engineers SP with parameters:", parameters);

    return db.query(sqlQuery, parameters, (err, rows) => {
        if (err) {
            console.error("DB Error in Save_engineers:", err);
            return callback(err, null);
        }

        console.log("DB Result from Save_engineers:", rows);
        callback(null, rows);
    });
},



Delete_engineers: function(engineers_Id_, callback) {
  return db.query(
    "CALL Delete_engineers(@engineers_Id_ := ?)", 
    [engineers_Id_], 
    callback
  );
},

  //SQL Call for stage.

  Save_Stage: function (Stage_, callback) {
    return db.query(
      "CALL Save_Stage(?, ?)",
      [Stage_.Stage_Id, Stage_.Stage_Name],
      callback
    );
  },

  Get_All_Stage: function (Stage_Name_, callback) {
    if (Stage_Name_ === undefined || Stage_Name_ === "undefined")
      Stage_Name_ = "";
    return db.query(
      "CALL Get_All_Stage(@Stage_Name_ :=?)",
      [Stage_Name_],
      callback
    );
  },

  Delete_Stage: function (Stage_Id_, callback) {
    return db.query("CALL Delete_Stage(@Stage_Id_ :=?)", [Stage_Id_], callback);
  },

  //SQL Call for Source_Category

  Save_Source_Category: function (Source_Category, callback) {
    return db.query(
      "CALL Save_Source_Category(?, ?)",
      [
        Source_Category.Source_Category_Id,
        Source_Category.Source_Category_Name,
      ],
      callback
    );
  },

  Get_All_Source_Category: function (Source_Category_Name_, callback) {
    if (
      Source_Category_Name_ === undefined ||
      Source_Category_Name_ === "undefined"
    )
      Source_Category_Name_ = "";
    return db.query(
      "CALL Get_All_Source_Category(@Source_Category_Name_ :=?)",
      [Source_Category_Name_],
      callback
    );
  },

  Delete_Source_Category: function (Source_Category_Id_, callback) {
    return db.query(
      "CALL Delete_Source_Category(@Source_Category_Id_ :=?)",
      [Source_Category_Id_],
      callback
    );
  },

  Get_Districts: function (callback) {
    const sql = "CALL Get_Districts()";
    db.query(sql, callback);
  },

  Get_CustomFields_On_EnquirySource: function (enquiry_source_id, lead_id_, callback) {
    console.log('lead_id_: ', lead_id_);
    console.log('status_id_: ', enquiry_source_id);
if (!enquiry_source_id) enquiry_source_id = 0;
  if (lead_id_ === undefined || lead_id_ === "undefined") lead_id_ = 0;

  return db.query(
    "CALL Get_CustomFields_On_EnquirySource(@_enquiry_source_id := ?, @_lead_id := ?)",
    [enquiry_source_id, lead_id_],
    callback
  );
},
Get_CustomFields_On_EnquiryFor: function (enquiry_for_id, lead_id_, callback) {
  console.log("lead_id_: ", lead_id_);
  console.log("enquiry_for_id_: ", enquiry_for_id);

  if (!enquiry_for_id) enquiry_for_id = 0;
  if (lead_id_ === undefined || lead_id_ === "undefined") lead_id_ = 0;

  return db.query(
    "CALL Get_CustomFields_On_EnquiryFor(@_enquiry_for_id := ?, @_lead_id := ?)",
    [enquiry_for_id, lead_id_],
    callback
  );
},

};

module.exports = lead;
