var db = require("../dbconnection");
var fs = require("fs");
var task = {
  Save_task: function (task_, callback) {
    // Generate a unique ID if Task_Master_Id is 0 (new task)

    return db.query(
      "CALL Save_task(" +
        "@Task_Master_Id_ :=?," +
        "@Task_Status_Id_ :=?," +
        "@Task_Status_Name_ :=?," +
        "@Task_user_ :=?," +
        "@Customer_Id_ :=?," +
        "@Created_By_ :=?," +
        "@Task_Date_ :=?," +
        "@Task_Type_Id_ :=?," +
        "@Task_Type_Name_ :=?," +
        "@Description_ :=?," +
        "@Task_Time_ :=?," +
        "@Completion_Date_ :=?," +
        "@Completion_Time_ :=?," +
         "@Task_Files_ :=?" +
        ")",
      [
        task_.Task_Master_Id,
        task_.Task_Status_Id,
        task_.Task_Status_Name,
        JSON.stringify(task_.Task_user),
        task_.Customer_Id,
        task_.Created_By,
        task_.Task_Date,
        task_.Task_Type_Id,
        task_.Task_Type_Name,
        task_.Description,
        task_.Task_Time,
        task_.Completion_Date,
        task_.Completion_Time,
        JSON.stringify(task_.Task_Files || []), 
      ],
      callback
    );
  },
  Save_notification: function (notification, callback) {
    return db.query(
      "CALL Save_notification(?, ?, ?, ?, ?)",
      [
        notification.title,
        notification.body,
        notification.Task_Master_Id,
        notification.User_Details_Id,
        notification.Menu_Id,
      ],
      callback
    );
  },
  Get_Notifications_By_UserId: function (User_Details_Id, callback) {
    try {
      return db.query(
        "CALL Get_Notifications_By_UserId(?)",
        [User_Details_Id],
        callback
      );
    } catch (error) {
      console.error("Error in Get_Notifications_By_UserId:", error);
      callback(error, null);
    }
  },
  Delete_task: function (task_Id_, callback) {
    return db.query("CALL Delete_task(@task_Id_ :=?)", [task_Id_], callback);
  },
  Get_task: function (task_Id_, callback) {
    return db.query("CALL Get_task(@task_Id_ :=?)", [task_Id_], callback);
  },
  Get_Task_Users: function (Task_Master_Id_, callback) {
    return db.query(
      "CALL Get_Task_Users(@Task_Master_Id_ :=?)",
      [Task_Master_Id_],
      callback
    );
  },
  Get_task_mobile: function (task_Id_, callback) {
    return db.query(
      "CALL Get_task_mobile(@task_Id_ :=?)",
      [task_Id_],
      callback
    );
  },
  Search_task: function (
    Customer_Name_,
    Task_Status_Id_,
    To_User_,
    Is_Date_,
    Fromdate_,
    Todate_,
    User_Details_Id_, // 👈 Added parameter
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined")
      Customer_Name_ = "";

    return db.query(
      "CALL Search_task(@Customer_Name_ :=?, @Task_Status_Id_ :=?, @To_User_ :=?, @Is_Date_ :=?, @Fromdate_ :=?, @Todate_ :=?, @User_Details_Id_ :=?)",
      [
        Customer_Name_,
        Task_Status_Id_,
        To_User_,
        Is_Date_,
        Fromdate_,
        Todate_,
        User_Details_Id_,
      ], // 👈 Include it in args
      callback
    );
  },
  
  Search_task_by_customer: function (
    Customer_Name_,
    Task_Status_Id_,
    To_User_,
    Is_Date_,
    Fromdate_,
    Todate_,
    Task_Type_Id_,
    Page_Index,
    PageSize,
    User_Details_Id_,
    callback
  ) {
    // Fallbacks and sanitization-----> This is for to handle null or undefined input values before passing into the sp;
    Customer_Name_ = Customer_Name_ || "";
    Task_Status_Id_ = parseInt(Task_Status_Id_) || 0;
    To_User_ = parseInt(To_User_) || 0;
    Is_Date_ = parseInt(Is_Date_) || 0;
    Fromdate_ = Fromdate_ || "";
    Todate_ = Todate_ || "";
    Task_Type_Id_ = parseInt(Task_Type_Id_) || 0;
    Page_Index = parseInt(Page_Index) > 0 ? parseInt(Page_Index) : 1;
    PageSize = parseInt(PageSize) > 0 ? parseInt(PageSize) : 10;
    User_Details_Id_ = parseInt(User_Details_Id_) || 0;

    console.log(Page_Index, PageSize);
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined")
      Customer_Name_ = "";
    return db.query(
      "CALL Search_task_by_customer(@Customer_Name_ :=?,@Task_Status_Id_ :=?,@To_User_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@Task_Type_Id_ :=?,@Page_Index_ :=?,@PageSize_ :=?,@User_Details_Id_ :=?)",
      [
        Customer_Name_,
        Task_Status_Id_,
        To_User_,
        Is_Date_,
        Fromdate_,
        Todate_,
        Task_Type_Id_,
        Page_Index,
        PageSize,
        User_Details_Id_,
      ],
      callback
    );
  },

  Search_task_Report: function (
    Customer_Name_,
    Task_Status_Id_,
    To_User_,
    Is_Date_,
    Fromdate_,
    Todate_,
    Task_Type_Id_,User_Details_Id,
    callback
  ) {
    if (Customer_Name_ === undefined || Customer_Name_ === "undefined")
      Customer_Name_ = "";
    return db.query(
      "CALL Search_task_Report(@Customer_Name_ :=?,@Task_Status_Id_ :=?,@To_User_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?,@Task_Type_Id_ :=? ,@User_Details_Id_ :=? )",
      [
        Customer_Name_,
        Task_Status_Id_,
        To_User_,
        Is_Date_,
        Fromdate_,
        Todate_,
        Task_Type_Id_,User_Details_Id
      ],
      callback
    );
  },
  Task_Start_Button_click: function (task_, callback) {
    return db.query(
      "CALL Task_Start_Button_click(" + "@Task_Id_ :=?" + ")",
      [task_.Task_Id],
      callback
    );
  },
  Task_Complete_Button_Click: function (task_, callback) {
    return db.query(
      "CALL Task_Complete_Button_Click(" + "@Task_Id_ :=?" + ")",
      [task_.Task_Id],
      callback
    );
  },
  Get_feedback_reports: function (
    Customer_Name_,
    Start_Date_,
    End_Date_,
    callback
  ) {
    return db.query(
      "CALL get_feedback_reports(@Customer_Name_ :=?, @Start_Date_ :=?, @End_Date_ :=?)",
      [Customer_Name_, Start_Date_, End_Date_],
      callback
    );
  },

  get_task_details_by_token: function (decoded, callback) {
    try {
      // Use the existing Get_task_mobile function with the decoded Task_Id
      return this.Get_task_mobile(decoded.Task_Id, callback);
    } catch (error) {
      callback(error, null);
    }
  },

  Task_History_Button_Click: function (
    User_Details_Id_,
    Is_Date_,
    Fromdate_,
    Todate_,
    callback
  ) {
    return db.query(
      "CALL Task_History_Button_Click(@User_Details_Id_ :=?,@Is_Date_ :=?,@Fromdate_ :=?,@Todate_ :=?)",
      [User_Details_Id_, Is_Date_, Fromdate_, Todate_],
      callback
    );
  },
  Save_task_note: function (task_, callback) {
    return db.query(
      "CALL Save_task_note(" +
        "@Task_Note_Id_ :=?," +
        "@Task_Note_ :=?," +
        "@Task_Id_ :=?," +
        "@User_Details_Id_ :=?" +
        ")",
      [
        task_.Task_Note_Id,
        task_.Task_Note,
        task_.Task_Id,
        task_.User_Details_Id,
      ],
      callback
    );
  },

  Save_task_document: function (task_, callback) {
    return db.query(
      "CALL Save_task_document(" +
        "@Task_Document_Id_ :=?," +
        "@File_Path_ :=?," +
        "@Task_Id_ :=?," +
        "@User_Details_Id_ :=?" +
        ")",
      [
        task_.Task_Document_Id,
        task_.File_Path,
        task_.Task_Id,
        task_.User_Details_Id,
      ],
      callback
    );
  },

  Get_task_note: function (Task_Id_, User_Details_Id_, callback) {
    return db.query(
      "CALL Get_task_note(@Task_Id_ :=?,@User_Details_Id_ :=?)",
      [Task_Id_, User_Details_Id_],
      callback
    );
  },

  Get_task_document: function (Task_Id_, User_Details_Id_, callback) {
    return db.query(
      "CALL Get_task_document(@Task_Id_ :=?,@User_Details_Id_ :=?)",
      [Task_Id_, User_Details_Id_],
      callback
    );
  },

  Delete_task_note: function (Task_Note_Id_, callback) {
    return db.query(
      "CALL Delete_task_note(@Task_Note_Id_ :=?)",
      [Task_Note_Id_],
      callback
    );
  },
  Delete_task_document: function (Task_Document_Id_, callback) {
    return db.query(
      "CALL Delete_task_document(@Task_Document_Id_ :=?)",
      [Task_Document_Id_],
      callback
    );
  },
  Get_task_By_Customer: function (
    Customer_Id_,
    Task_Type_Id_ = 0,
    Task_Status_Id_ = 0,
    callback
  ) {
    return db.query(
      "CALL Get_task_By_Customer(@Customer_Id_ :=?, @Task_Type_Id_ :=?, @Task_Status_Id_ :=?)",
      [Customer_Id_, Task_Type_Id_, Task_Status_Id_],
      callback
    );
  },
  Get_task_By_Customer_With_Documents: function (Customer_Id_, callback) {
    return db.query(
      "CALL Get_task_By_Customer_With_Documents(@Customer_Id_ :=?)",
      [Customer_Id_],
      callback
    );
  },
  Save_Version: function (task_, callback) {
    return db.query(
      "CALL Save_Version(" + "@VersionNumber_ :=?" + ")",
      [task_.VersionNumber],
      callback
    );
  },

  Get_Version: function (callback) {
    return db.query("CALL Get_Version()", [], callback);
  },

  get_task_expense_by_reference: function (Task_Id_, Type_Id_, callback) {
    return db.query(
      "CALL get_task_expense_by_reference(?, ?)",
      [Task_Id_, Type_Id_],
      callback
    );
  },

  Save_expense_details: function (expenseDetails, callback) {
    return db.query(
      "CALL Save_expense_details(?, ?, ?, ?, ?, ?, ?, ?)",
      [
        expenseDetails.Task_Expense_Id,
        expenseDetails.Expense_Type_Id,
        expenseDetails.Task_Id,
        expenseDetails.User_Id,
        expenseDetails.Expense_Reference_Id,
        expenseDetails.Description,
        expenseDetails.Date,
        expenseDetails.Time,
      ],
      callback
    );
  },

  get_task_expense: function (user_id, task_id, callback) {
    const query = "CALL get_task_expense(?, ?)";
    db.query(query, [user_id, task_id], (err, result) => {
      if (err) {
        callback(err, null);
      } else {
        callback(null, result);
      }
    });
  },
  Change_Task_Status: function (taskData, callback) {
    return db.query(
      "CALL Change_Task_Status(?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [
        taskData.Task_Id,
        taskData.Status_Id,
        taskData.Status_Name,
        taskData.By_User_Id,
        taskData.Description,
        taskData.Next_FollowUp_Date,
        taskData.Tasks,
        taskData.Is_Active,
        taskData.Location,
      ],
      callback
    );
  },
  Get_Task_Info_Dashboard: function (User_Details_Id,callback) {
    try {
      console.log();
      
      const query = "CALL Get_Task_Info_Dashboard(?)";
      db.query(query, [User_Details_Id], (err, result) => {
      if (err) {
        callback(err, null);
      } else {
        callback(null, result);
      }
      });
    } catch (error) {
      console.log("Get_Task_Info_Dashboard", error);
      callback(err, null);
    }
  },
};
module.exports = task;
