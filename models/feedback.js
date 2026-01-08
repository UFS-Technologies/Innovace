var db = require('../dbconnection');

var feedback = {
Save_feedback: function(feedback_, callback) {
    return db.query("CALL Save_feedback(@Feedback_Id_ :=?,@Task_Id_ :=?,@Customer_Id_ :=?,@Feedback_Text_ :=?,@Delete_Status_ :=?)",
        [
            feedback_.Feedback_Id,
            feedback_.Task_Id,
            feedback_.Customer_Id,
            feedback_.Feedback_Text,
            feedback_.Delete_Status || 0
        ], callback);
},

Check_existing_feedback: function(Task_Id_, Customer_Id_, callback) {
    return db.query("SELECT Feedback_Id FROM feedback WHERE Task_Id = ? AND Customer_Id = ? AND Delete_Status = 0", 
        [Task_Id_, Customer_Id_], callback);
},


    Get_feedback: function(Feedback_Id_, callback) {
        return db.query("CALL Get_feedback(@Feedback_Id_ :=?)", [Feedback_Id_], callback);
    },

    Get_feedback_by_task: function(Task_Id_, callback) {
        return db.query("CALL Get_feedback_by_task(@Task_Id_ :=?)", [Task_Id_], callback);
    },

    Delete_feedback: function(Feedback_Id_, callback) {
        return db.query("CALL Delete_feedback(@Feedback_Id_ :=?)", [Feedback_Id_], callback);
    }
};

module.exports = feedback;


