var db = require("../dbconnection");
var fs = require("fs");
var status = {
 Save_status: function (status_, callback) {
  return db.query(
    "CALL Save_status(" +
      "@Status_Id_ := ?," +
      "@Status_Name_ := ?," +
      "@Status_Order_ := ?," +
      "@Followup_ := ?," +
      "@Is_Registered_ := ?," +
      "@Color_Code_ := ?," +
      "@ViewIn_Id_ := ?," +
      "@ViewIn_Name_ := ?," +
      "@Stage_Id_ := ?," +
      "@Stage_Name_ := ?," +
      "@Progress_Value_ := ?," +
      "@p_custom_fields_json := ?" + // 👈 added parameter
      ")",
    [
      status_.Status_Id,
      status_.Status_Name,
      status_.Status_Order,
      status_.Followup,
      status_.Is_Registered,
      status_.Color_Code,
      status_.ViewIn_Id,
      status_.ViewIn_Name,
      status_.Stage_Id,
      status_.Stage_Name,
      status_.Progress_Value,
      JSON.stringify(status_.Custom_Fields || []) // 👈 JSON string or empty array
    ],
    callback
  );
},
  Get_CustomFields_On_StatusChange: function (status_id_, lead_id_, callback) {
    console.log('lead_id_: ', lead_id_);
    console.log('status_id_: ', status_id_);
  if (status_id_ === undefined || status_id_ === "undefined") status_id_ = 0;
  if (lead_id_ === undefined || lead_id_ === "undefined") lead_id_ = 0;

  return db.query(
    "CALL Get_CustomFields_On_StatusChange(@_status_id := ?, @_lead_id := ?)",
    [status_id_, lead_id_],
    callback
  );
},
  Delete_status: function (status_Id_, callback) {
    return db.query(
      "CALL Delete_status(@status_Id_ :=?)",
      [status_Id_],
      callback
    );
  },
  Get_status: function (status_Id_, callback) {
    return db.query("CALL Get_status(@status_Id_ :=?)", [status_Id_], callback);
  },
  Get_status_by_task_type_id: function (Task_Type_Id_, ViewIn_Id_, callback) {
    console.log("Task_Type_Id_, ViewIn_Id_", Task_Type_Id_, ViewIn_Id_);

    return db.query(
      "CALL Get_status_by_task_type_id(?, ?)",
      [Task_Type_Id_, ViewIn_Id_],
      callback
    );
  },
  Search_status: function (status_Name_, ViewIn_Id_, callback) {
    if (status_Name_ === undefined || status_Name_ === "undefined")
      status_Name_ = "";
    if (
      ViewIn_Id_ === undefined ||
      ViewIn_Id_ === "undefined" ||
      ViewIn_Id_ === null
    ) {
      ViewIn_Id_ = 0;
    }
    return db.query(
      "CALL Search_status(@status_Name_ :=?,@ViewIn_Id_ :=?)",
      [status_Name_, ViewIn_Id_],
      callback
    );
  },
};

module.exports = status;
