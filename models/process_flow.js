var db = require("../dbconnection");

var processFlow = {
  Save_Process_Flow: function (flowData, callback) {
    return db.query(
      "CALL Save_Process_Flow(?, ?, ?, ?,?,?)",
      [
        flowData.flow_id || 0,
        flowData.task_type_id,
        flowData.status_id,
        JSON.stringify(flowData.flow_tasks),
        JSON.stringify(flowData.mandatory_tasks),
        JSON.stringify(flowData.documents),
      ],
      callback
    );
  },
  // Delete_Process_Flow_By_Id
  Delete_Process_Flow_By_Id: function (flowId, callback) {
    return db.query(
      "CALL Delete_Process_Flow_By_Id(?)",
      [flowId],
      callback
    );
  },
  Delete_Process_Flow: function (flow_id, callback) {
    return db.query("CALL Delete_Process_Flow(?)", [flow_id], callback);
  },
  Get_Process_Flow_By_Id: function (flow_id, callback) {
    return db.query("CALL Get_Process_Flow_By_Id(?)", [flow_id], callback);
  },
  get_all_dropDown_processFlow: function (callback) {
    return db.query("CALL get_all_dropDown_processFlow()", [], callback);
  },
  Get_All_Process_Flow: function (callback) {
    return db.query("CALL Get_All_Process_Flow()", callback);
  },
  Get_Task_Types_Of_Process_Flow: function (task, callback) {
    console.log("task", task);  
    
    return db.query(
      "CALL Get_Task_Types_Of_Process_Flow(?,?,?,?)",
      [task.Task_Type_Id, task.Status_Id, task.Customer_Id, task.Login_User_Id],
      callback
    );
  },
  Get_Task_Type_Of_Department: function (Department_Id_, callback) {
    return db.query(
      "CALL Get_Task_Type_Of_Department(?)",
      [Department_Id_],
      callback
    );
  },
};

module.exports = processFlow;
