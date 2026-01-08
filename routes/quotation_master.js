var express = require("express");
var router = express.Router();
var quotation_master = require("../models/quotation_master");

router.post("/Save_quotation_master/", function (req, res, next) {
  try {
    quotation_master.Save_quotation_master(req.body, function (err, rows) {
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
router.get("/Search_Quotation_Report/", function (req, res, next) {
  try {
    quotation_master.Search_Quotation_Report(
      req.query.Quotation_No,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.To_User_Id,
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
  "/Get_quotation_master/:quotation_master_Id_?",
  function (req, res, next) {
    try {
      quotation_master.Get_quotation_master(
        req.params.quotation_master_Id_,
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
  }
);
router.delete(
  "/Delete_quotation_master/:quotation_master_Id_?",
  function (req, res, next) {
    try {
      quotation_master.Delete_quotation_master(
        req.params.quotation_master_Id_,
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
  }
);

router.get("/Get_Quotation_By_Customer/", function (req, res, next) {
  try {
    quotation_master.Get_Quotation_By_Customer(
      req.query.Customer_Id,
      req.query.Quotation_Status_Id,
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

router.get("/Search_Quotaion_Report/", function (req, res, next) {
  try {
    quotation_master.Search_Quotaion_Report(
      req.query.Product_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.Quotation_Status_Id,
      req.User_Details_Id,
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

module.exports = router;
