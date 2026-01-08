var express = require("express");
var router = express.Router();
var task_status = require("../models/task_status");
const socketManager = require('../socket'); // Import socket manager

router.post("/Save_task_status/", function (req, res, next) {
  try {
    console.log("the task status is",req.body);
    
    task_status.Save_task_status(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        console.log("the task status is",rows);
        
        res.json(rows);
      }
    });
  } catch (e) {
    console.log("Error in Save_task_status: ", e);
    // res.status(500).json({ success: false, error: e.message });
  } 
});

router.get("/Search_task_status/", function (req, res, next) {
  try {
    task_status.Search_task_status(
      req.query.task_status_Name,
      function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});
router.get("/Get_task_status/:task_status_Id_?", function (req, res, next) {
  try {
    task_status.Get_task_status(
      req.params.task_status_Id_,
      function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});
router.get("/Delete_task_status/:task_status_Id_?", function (req, res, next) {
  try {
    task_status.Delete_task_status(
      req.params.task_status_Id_,
      function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});

router.get("/Search_task_type/", function (req, res, next) {
  console.log("the Is_Active value is",req.query.Is_Active)
  try {
    task_status.Search_task_type(
      req.query.Task_Type_Name,
      function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});

router.post("/Save_task_type/", function (req, res, next) {
  try {
    task_status.Save_task_type(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0][0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.get("/Get_All_Task_Type_Status", function (req, res, next) {
  try {
    task_status.Get_All_Task_Type_Status(function (err, rows) {
      if (err) {
        res.status(500).json({ success: false, error: err });
      } else {
        res
          .status(200)
          .json({
            success: true,
            data: { task_type: rows[0], task_type_status: rows[1] },
          });
      }
    });
  } catch (e) {
    res.status(500).json({ success: false, error: e.message });
  }
});

router.delete("/Delete_task_type/:Task_Type_Id_?", function (req, res, next) {
  try {
    task_status.Delete_task_type(
      req.params.Task_Type_Id_,
      function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows[0][0]);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});
module.exports = router;
