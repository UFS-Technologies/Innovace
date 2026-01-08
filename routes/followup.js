 var express = require('express');
 var router = express.Router();
 var followup=require('../models/followup');
router.post('/Save_followup/', function (req, res, next) {
  try {
    console.log("req.body",req.body);
    followup.Save_followup(req.body.FollowUp, req.body.Customer_Id, req.body.customFields || [], function (err, rows) {
      console.log(req.body.followup)
      if (err) {
        console.log('err: ', err);
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
router.post('/Save_engineer_followup', (req, res) => {
    console.log("🚀 Route hit: /Save_engineer_followup");

    const data = req.body;

    console.log("Request body:", data);

    followup.Save_engineer_followup(
        data.followup,          // ✅ Correct key
        data.Engineers_Id,      // ✅ Correct
        data.customFields,      // ✅ Correct key
        (err, rows) => {
            if (err) {
                console.error("DB Error:", err);
                return res.status(500).json({ 
                    message: "Failed to save engineer follow-up", 
                    error: err 
                });
            }

            console.log("DB result:", rows);

            return res.json({
                message: "Engineer follow-up saved successfully",
                engineer_followup_id: rows[0][0].Engineer_FollowUp_Id
            });
        }
    );
});


 router.get('/Search_followup/',function(req,res,next)
 { 
 try 
 {
followup.Search_followup(req.query.followup_Name, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });
 router.get('/Get_followup/:followup_Id_?',function(req,res,next)
 { 
 try 
 {
followup.Get_followup(req.params.followup_Id_, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });
 router.get('/Delete_followup/:followup_Id_?',function(req,res,next)
 { 
 try 
 {
followup.Delete_followup(req.params.followup_Id_, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });

router.get('/FollowUp_Summary/', function (req, res, next) {
  try {
    followup.FollowUp_Summary(req.query.User, function (err, rows) {
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

router.get('/Dashboard_FollowUp_Summary/', function (req, res, next) {
  try {
    followup.Dashboard_FollowUp_Summary(req.query.User, function (err, rows) {
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

router.get('/Pending_FollowUp/', function (req, res, next) {
  try {
    followup.Pending_FollowUp(req.query.By_User, function (err, rows) {
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

  module.exports = router;

