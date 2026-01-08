var db = require('../dbconnection');
var attendance =
{


    Mark_Attendance: function (masterId, userId, name, code, photo, location, lat, long, entryDate, checkInTime, callback) {
        return db.query(
            "CALL Mark_Attendance(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [masterId, userId, name, code, photo, location, lat, long, entryDate, checkInTime],
            callback
        );
    },
    mark_attendance: function (params, callback) {
    return db.query(
      "CALL mark_attendance(@User_Details_Id:=?, @User_Details_Name:=?, @photo:=?, @location:=?, @latitude:=?, @longitude:=?)",
      params,
      callback
    );
  },
 
    getAttendanceStatus: function (employeeCode, callback) {
        return db.query(
            "CALL Get_Latest_Attendance_Status(?)",
            [employeeCode],
            callback
        );
    },
    Mark_Checkout: function (employeeCode, callback) {
        return db.query(
            "CALL Mark_Checkout(?)",
            [employeeCode],
            callback
        );
    },
    Get_User_Attendance_Details: function(status, callback) {
        return db.query("CALL Get_User_Attendance_Details(?)", [status], callback);
    }, 
    Get_All_User_Attendance_Details: function(callback) {
        return db.query("CALL Get_All_User_Attendance_Details()", callback);
    },
    Get_Attendance_By_DateRange: function(fromDate, toDate,User_Details_Id, callback) {
        console.log(User_Details_Id)
        const sql = "CALL Get_Attendance_By_DateRange(?, ?,?)";
        return db.query(sql, [fromDate, toDate,User_Details_Id], callback);
    },    
    Get_New_User_Attendance_Details: function(callback) {
        return db.query("CALL Get_New_User_Attendance_Details()", callback);
    },   
    Save_Multiple_Attendance_Details: function (attendanceJSON, callback) {
        return db.query("CALL Save_Multiple_Attendance_Details(?)", [JSON.stringify(attendanceJSON)], callback);
    },
    getAttendanceReport: function (params, callback) {
        return db.query(
            "CALL get_attendance_report(@fromDate:=?, @toDate:=?, @userId:=?, @searchName:=?)",
            [
                params.fromDate || '',
                params.toDate || '',
                params.userId || 0,
                params.searchName || ''
            ],
            callback
        );
    }
    //   mark_attendance: function(params, callback) {
    //       return db.query(
    //           "CALL mark_attendance(@User_Details_Id:=?, @User_Details_Name:=?, @photo:=?, @location:=?, @latitude:=?, @longitude:=?)",
    //           params,
    //           callback
    //       );
    //   },
};
module.exports = attendance;

