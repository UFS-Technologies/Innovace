const express = require("express");
const router = express.Router();
const attendance = require('../models/attendance');

// Mark Attendance
router.post("/mark_attendance", function (req, res, next) {
  try {
    const attendanceData = [
      req.body.User_Details_Id,
      req.body.User_Details_Name,
      req.body.photo,
      req.body.location,
      req.body.latitude,
      req.body.longitude,
    ];
 
    attendance.mark_attendance(attendanceData, function (err, rows) {
      if (err) {
        res.status(500).json({
          success: false,
          message: "Failed to mark attendance",
          error: err,
        });
      } else {
        res.json({
          success: true,
          message: "Attendance marked successfully",
          data: rows[0],
        });
      }
    });
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});

// Get latest attendance status by Employee_Code
router.get('/get_attendance_status', function (req, res) {
    const { Employee_Code } = req.body;

    if (!Employee_Code) {
        return res.status(400).json({
            success: false,
            message: 'Employee_Code is required'
        });
    }

    attendance.getAttendanceStatus(Employee_Code, function (err, rows) {
        if (err) {
            return res.status(500).json({
                success: false,
                message: 'Database error',
                error: err
            });
        }
        const result = rows[0][0];
        console.log('result', result);
        if (!result || result.Attendance_Master_Id === null) {
            return res.status(200).json({
                success: false,
                message: 'Employee has not yet checked in',
                data: null
            });
        }

        res.status(200).json({
            success: true,
            message: 'Attendance status fetched successfully',
            data: rows[0]
        });
    });
});

// attendance checkout
router.post('/Mark_checkout', async (req, res) => {
    const { Employee_Code } = req.body;

    if (!Employee_Code) {
        return res.status(400).json({ success: false, message: 'Missing Employee_Code' });
    }

    try {
        attendance.Mark_Checkout(Employee_Code, (err, results) => {
            if (err) {
                return res.status(500).json({ success: false, message: 'Database error', error: err });
            }

            const result = results[0][0];

            if (result && result.Attendance_Details_Id) {
                // Successful checkout
                return res.status(200).json({
                    success: true,
                    message: 'Checked out successfully',
                    Attendance_Details_Id: result.Attendance_Details_Id
                });
            } else if (result && result.Message) {
                // Already logged out or no matching check-in
                return res.status(200).json({
                    success: false,
                    message: result.Message
                });
            } else {
                // Unexpected fallback
                return res.status(500).json({
                    success: false,
                    message: 'Unexpected response from database'
                });
            }
        });
    } catch (error) {
        console.error('Checkout error:', error);
        res.status(500).json({ success: false, message: 'Internal server error', error: error.message });
    }
});

// Get User Attendance Details
router.get('/Get_User_Attendance_Details', (req, res) => {
    const status = req.query.Attendance_Master_Id || 1; // Default to 1 if not provided

    attendance.Get_User_Attendance_Details(status, (err, rows) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error', error: err });
        }

        res.status(200).json({
            success: true,
            message: 'User attendance data fetched successfully',
            data: rows[0]
        });
    });
});

// Get_All_User_Attendance_Details
router.get('/Get_All_User_Attendance_Details', (req, res) => {
    attendance.Get_All_User_Attendance_Details((err, rows) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error', error: err });
        }

        res.status(200).json({
            success: true,
            message: 'User attendance data fetched successfully',
            data: rows[0]
        });
    });
});

// Get_Attendance_By_DateRange
router.get('/Get_Attendance_By_DateRange', (req, res) => {
    const   fromDate  = req.query.fromDate;
    const   toDate = req.query.toDate;

    attendance.Get_Attendance_By_DateRange(fromDate, toDate,req.User_Details_Id, (err, rows) => {
        
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error', error: err });
        }

        res.status(200).json({
            success: true,
            message: 'User attendance data fetched successfully',
            data: rows[0]
        });
    });
});

// Get Create User Attendance Details
router.get('/Get_New_User_Attendance_Details', (req, res) => {
    attendance.Get_New_User_Attendance_Details((err, rows) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ success: false, message: 'Database error', error: err });
        }

        res.status(200).json({
            success: true,
            message: 'User attendance data fetched successfully',
            data: rows[0]
        });
    });
});

// Save Multiple Attendance Details
router.post('/Save_Multiple_Attendance_Details', (req, res) => {
    const attendanceList = req.body.attendanceList;

    if (!Array.isArray(attendanceList) || attendanceList.length === 0) {
        return res.status(400).json({ success: false, message: "attendanceList must be a non-empty array" });
    }

    // Transform input: combine date and time parts into full datetime strings
    const transformedList = attendanceList.map(item => ({
        ...item,
        Check_In_Time: `${item.Check_In_Date} ${item.Check_In_Time_Only}`,
        Check_Out_Time: `${item.Check_Out_Date} ${item.Check_Out_Time_Only}`
    }));

    attendance.Save_Multiple_Attendance_Details(transformedList, (err, rows) => {
        if (err) {
            console.error("DB Error:", err);
            return res.status(500).json({ success: false, message: "Database error", error: err });
        }
        res.status(200).json({ success: true, message: "Attendance updated", data: rows });
    });
});

// Attendance Report Route
router.get('/attendance_report', function (req, res, next) {
    try {
        const filters = {
            fromDate: req.query.fromDate || '',
            toDate: req.query.toDate || '',
            userId: parseInt(req.query.userId) || 0,
            searchName: req.query.searchName || ''
        };

        attendance.getAttendanceReport(filters, function (err, rows) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to get attendance report',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Attendance report retrieved successfully',
                    data: rows[0],
                    total: rows[0] ? rows[0].length : 0
                });
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});

// router.post('/mark_attendance', function(req, res, next) {

//     try {


//       console.log('req:bodyy ', req.body);
//         const attendanceData = [
//             req.body.User_Details_Id,
//             req.body.User_Details_Name,
//             req.body.photo ,
//             req.body.location,
//             req.body.latitude,
//             req.body.longitude
//         ];

//         attendance.mark_attendance(attendanceData, function(err, rows) {
//             if (err) {
//                 res.status(500).json({
//                     success: false,
//                     message: 'Failed to mark attendance',
//                     error: err
//                 });
//             } else {
//                 res.json({
//                     success: true,
//                     message: 'Attendance marked successfully',
//                     data: rows[0]
//                 });
//             }
//         });
//     } catch (e) {
//         res.status(500).json({
//             success: false,
//             message: 'Internal server error',
//             error: e.message
//         });
//     }
//   });

module.exports = router;
