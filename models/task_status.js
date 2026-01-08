var db = require("../dbconnection");
var fs = require("fs");
var task_status = {
  Save_task_status: function (task_status_, callback) {
    return db.query(
      "CALL Save_task_status(" +
        "@Task_Status_Id_ :=?," +
        "@Task_Status_Name_ :=?" +
        ")",
      [task_status_.Task_Status_Id, task_status_.Task_Status_Name],
      callback
    );
  },
  Delete_task_status: function (task_status_Id_, callback) {
    return db.query(
      "CALL Delete_task_status(@task_status_Id_ :=?)",
      [task_status_Id_],
      callback
    );
  },
  Get_task_status: function (task_status_Id_, callback) {
    return db.query(
      "CALL Get_task_status(@task_status_Id_ :=?)",
      [task_status_Id_],
      callback
    );
  },
  Search_task_status: function (task_status_Name_, callback) {
    if (task_status_Name_ === undefined || task_status_Name_ === "undefined")
      task_status_Name_ = "";
    return db.query(
      "CALL Search_task_status(@task_status_Name_ :=?)",
      [task_status_Name_],
      callback
    );
  },
  Search_task_type: function (Task_Type_Name_, callback) {
    if (Task_Type_Name_ === undefined || Task_Type_Name_ === "undefined")
      Task_Type_Name_ = "";
    return db.query(
      "CALL Search_task_type(@Task_Type_Name_ :=?)",
      [Task_Type_Name_],
      callback
    );
  },
  Save_task_type: function (task_type_, callback) {
    return db.query(
      "CALL Save_task_type(" +
        "@Task_Type_Id_ :=?," +
        "@Task_Type_Name_ :=?," +
        "@Task_Type_Color_ :=?," +
        "@Task_Type_Image_ :=?," +
        "@Department_Ids_ :=?," +
        "@Branch_Ids_ :=?," +
        "@default_status_id_ :=?," +
        "@Duration_ :=?," +
        "@task_type_status_ :=?," +
        "@Is_Active_ :=?," +
        "@Location_Tracking_ :=?" +
        ")",
      [
        task_type_.Task_Type_Id,
        task_type_.Task_Type_Name,
        task_type_.Task_Type_Color,
        task_type_.Task_Type_Image,
        task_type_.Department_Ids,
        task_type_.Branch_Ids,
        task_type_.default_status_id,
        task_type_.Duration,
        JSON.stringify(task_type_.task_type_status),
        task_type_.Is_Active,
        task_type_.Location_Tracking
      ],
      callback
    );
  },
  Delete_task_type: function (Task_Type_Id_, callback) {
    return db.query(
      "CALL Delete_task_type(@Task_Type_Id_ :=?)",
      [Task_Type_Id_],
      callback
    );
  },
  Get_All_Task_Type_Status: function (callback) {
    return db.query("CALL Get_All_Task_Type_Status()", [], callback);
  },
};
module.exports = task_status;
