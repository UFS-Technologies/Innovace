var express = require('express');
var router = express.Router();
var user_details = require('../models/user_details');


router.post('/Save_user_details', function (req, res, next) {
  try {
    console.log("Request Body:", req.body);
    user_details.Save_user_details(req.body, function (err, rows) {
      if (err) {
        console.error("Error occurred:", err);
        res.status(500).json({
          success: false,
          message: "An error occurred while saving user details",
          error: err
        });
      } else {
        res.status(200).json({
          success: true,
          message: "User details saved successfully",
          data: rows[0][0]
        });
      }
    });
  } catch (e) {
    console.error("Unexpected error:", e);
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message
    });
  }
});

router.post('/Update_User_Location', (req, res) => {
  const { User_Details_Id, location, latitude, longitude } = req.body;

  if (!User_Details_Id) {
    return res.status(400).json({ success: false, message: "User_Details_Id is required" });
  }

  user_details.Update_User_Location(User_Details_Id, location, latitude, longitude, (err, rows) => {
    if (err) {
      console.error("DB Error:", err);
      return res.status(500).json({ success: false, message: "Database error", error: err });
    }

    res.status(200).json({ success: true, message: "Location updated successfully", data: rows });
  });
});

router.get('/Get_All_User_Location_Details', (req, res) => {
  const userName = req.query.User_Details_Name || ''; 

  user_details.Get_All_User_Location_Details(userName, (err, rows) => {
    if (err) {
      console.error('Database error:', err);
      return res.status(500).json({ success: false, message: 'Database error', error: err });
    }

    if (rows && rows[0].length > 0) {
      res.status(200).json({
        success: true,
        message: 'User location details fetched successfully',
        data: rows[0]
      });
    } else {
      res.status(200).json({
        success: false,
        message: 'No active users found',
        data: []
      });
    }
  });
});

router.get('/Search_user_details/', function (req, res, next) {
  try {
    user_details.Search_user_details(req.query.user_details_Name, function (err, rows) {
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

router.get('/Get_user_details/:user_details_Id_?', function (req, res, next) {
  try {
    user_details.Get_user_details(req.params.user_details_Id_, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.delete('/Delete_user_details/:user_details_Id_?', function (req, res, next) {
  try {
    user_details.Delete_user_details(req.params.user_details_Id_, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0][0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.get('/Get_Menu_Permission/:User_Id_?', function (req, res, next) {
  try {
    user_details.Get_Menu_Permission(req.params.User_Id_, function (err, rows) {
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

router.get('/Search_Work_Summary/', function (req, res, next) {
  try {
    user_details.Search_Work_Summary(req.query.Fromdate, req.query.Todate, req.query.By_User, req.User_Details_Id, req.query.look_In_Date_Value,
      function (err, rows) {
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

router.get('/Search_conversion_Summary/', function (req, res, next) {
  try {
    user_details.Search_conversion_Summary(req.query.Fromdate, req.query.Todate, req.query.By_User, req.User_Details_Id, req.query.look_In_Date_Value,
      function (err, rows) {
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

router.get('/Search_Work_report/', function (req, res, next) {
  try {
    user_details.Search_Work_report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.SearchbyName,
      req.query.By_User,
      req.query.Is_Date_Check,
      req.query.Status_Id,
      req.User_Details_Id,
      function (err, rows) {
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

router.post('/Save_Sub_Users/', function (req, res, next) {
  try {
    // console.log("req body",req.body);

    user_details.Save_Sub_Users(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        // console.log("result",rows[0][0])
        res.json(rows[0][0]);
      }
    });
  }
  catch (e) {
    res.status(500).json({ error: e.message });
  }
});

router.get('/Get_Sub_Users/:user_details_id?', function (req, res, next) {
  try {
    // console.log("user_details_id params",req.params.user_details_id);

    user_details.Get_Sub_Users(req.params.user_details_id, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0][0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});


module.exports = router;

