var express = require("express");
var router = express.Router();
var status = require("../models/status");

router.post("/Save_status/", function (req, res, next) {
  try {
    status.Save_status(req.body, function (err, rows) {
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
// routes/lead.js
router.get("/Get_CustomFields_On_StatusChange", function (req, res, next) {
  try {
    status.Get_CustomFields_On_StatusChange(
      req.query.status_id,
      req.query.lead_id,
      function (err, rows) {
        if (err) {
          res.json(err);
          console.log('err: ', err);
        } else {
          res.json(rows[0]);
          console.log('rows[0]: ', rows[0]);
        }
      }
    );
  } catch (e) {
    console.log('e: ', e);
    res.status(500).json({ message: "Unhandled error", error: e.toString() });
  }
});
router.get("/Search_status/", function (req, res, next) {
  try {
    status.Search_status(
      req.query.status_Name,
      req.query.ViewIn_Id,
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
router.get("/Get_status/:status_Id_?", function (req, res, next) {
  console.log(
    "the status id coming is",
    req.params.status_Id_
  );
  try {
    status.Get_status(req.params.status_Id_, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows);
      }
    });
  } catch (e) {
  } finally {
  }
});
router.get(
  "/Get_status_by_task_type_id/:Task_Type_Id_/:ViewIn_Id_?",
  function (req, res, next) {
    console.log(
      "Incoming Task_Type_Id_:", req.params.Task_Type_Id_,
      "Incoming ViewIn_Id_:", req.params.ViewIn_Id_
    );
    try {
      status.Get_status_by_task_type_id(
        req.params.Task_Type_Id_,
        req.params.ViewIn_Id_,
        function (err, rows) {
          if (err) {
            res.json(err);
          } else {
            res.json(rows[0]);
          }
        }
      );
    } catch (e) {
      console.error(e);
      res.status(500).send("Internal Server Error");
    }
  }
);

router.delete("/Delete_status/:status_Id_?", function (req, res, next) {
  try {
    status.Delete_status(req.params.status_Id_, function (err, rows) {
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
module.exports = router;
