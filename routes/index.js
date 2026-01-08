const express = require("express");
const router = express.Router();
const auth=require('../modules/auth/auth.router');
var settings=require('../models/settings');
const task=require('../models/task');
const feedback=require('../models/feedback');
/* GET home page. */
router.get("/", function(req, res, next) {
  res.render("index", { title: "Express" });
});

router.get('/Get_Company_Details/', function (req, res, next) {
  try {
    settings.Get_Company_Details( function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.get('/get_task_details_by_token/', function(req, res, next) {
  try {
      const token = req.query.token;
      console.log('token: ', token);
      
      if (!token) {
          return res.json({
              success: false,
              message: 'Token is required'
          });
      }
      const jwt = require('jsonwebtoken');
      const JWT_SECRET = 'SolarisbackendOtpSent';
      
      // Verify and decode the token
      const decoded = jwt.verify(token, JWT_SECRET);

      // Check for existing feedback
      feedback.Check_existing_feedback(decoded.Task_Id, decoded.Customer_Id, function(checkErr, checkRows) {
          if (checkErr) {
              return res.json({
                  success: false,
                  message: 'Error checking existing feedback',
                  error: checkErr
              });
          }

          console.log('checkRows: ', checkRows);
          if (checkRows && checkRows.length > 0) {
              return res.json({
                  success: false,
                  message: 'Feedback already exists for this task and customer'
              });
          }

          // Proceed with getting task details
          task.get_task_details_by_token(decoded, function(err, rows) {
              if (err) {
                  if (err.name === 'JsonWebTokenError' || err.name === 'TokenExpiredError') {
                      return res.json({
                          success: false,
                          message: err.name === 'TokenExpiredError' ? 
                              'Token has expired' : 'Invalid token',
                          error: err.message
                      });
                  }
                  return res.json({
                      success: false,
                      message: 'Failed to fetch task details',
                      error: err
                  });
              }
              
              if (!rows || !rows[0] || !rows[0][0]) {
                  return res.json({
                      success: false,
                      message: 'No task details found'
                  });
              }

              res.json({
                  success: true,
                  message: 'Task details fetched successfully',
                  data: rows[0][0]
              });
          });
      });
  } catch (e) {
      res.json({
          success: false,
          message: 'Internal server error',
          error: e.message
      });
  }
});
router.use('/auth',auth);




module.exports = router;
