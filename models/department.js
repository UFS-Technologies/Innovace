var db = require('../dbconnection');

var department = {
    Search_department: function (department_name_, callback) {
        if (department_name_ === undefined || department_name_ === "undefined") {
            department_name_ = '';
        }
        return db.query("CALL Search_department(@department_name_ :=?)",
            [department_name_],
            callback);
    },
    Save_department: function (department_id, department_name, callback) {
        return db.query("CALL Save_department(@department_id :=?, @department_name :=?)",
            [department_id, department_name],
            callback);
    },
    Delete_department: function (department_id, callback) {
        return db.query("CALL Delete_department(@department_id :=?)",
            [department_id],
            callback);
    }
};

module.exports = department;