var express = require("express");
var router = express.Router();
var quotation_status = require("../models/quotation_status");

router.post("/Save_quotation_status/", function (req, res, next) {
  try {
    quotation_status.Save_quotation_status(req.body, function (err, rows) {
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
router.get("/Search_quotation_status/", function (req, res, next) {
  try {
    quotation_status.Search_quotation_status(
      req.query.quotation_status_Name,
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
router.get(
  "/Get_quotation_status/:quotation_status_Id_?",
  function (req, res, next) {
    try {
      quotation_status.Get_quotation_status(
        req.params.quotation_status_Id_,
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
  }
);
router.get(
  "/Delete_quotation_status/:quotation_status_Id_?",
  function (req, res, next) {
    try {
      quotation_status.Delete_quotation_status(
        req.params.quotation_status_Id_,
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
  }
);
module.exports = router;
