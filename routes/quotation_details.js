var express = require("express");
var router = express.Router();
var quotation_details = require("../models/quotation_details");

router.post("/Save_quotation_details/", function (req, res, next) {

  try {

    const items = req.body.items;
    const Quotation_Master_Id = req.body.Quotation_Master_Id;

    quotation_details.Save_quotation_details(
      items,
      Quotation_Master_Id,
      function (err, rows) {

        if (err) {
          res.json(err);
        } else {
          res.json(rows);
        }

      }
    );

  } catch (e) {

    res.json({
      success: false,
      error: e.message
    });

  }

});
router.get("/Search_quotation_details/", function (req, res, next) {
  try {
    quotation_details.Search_quotation_details(
      req.query.quotation_details_Name,
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
router.get(
  "/Get_quotation_details/:quotation_details_Id_?",
  function (req, res, next) {
    try {
      quotation_details.Get_quotation_details(
        req.params.quotation_details_Id_,
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
  "/Delete_quotation_details/:quotation_details_Id_?",
  function (req, res, next) {
    try {
      quotation_details.Delete_quotation_details(
        req.params.quotation_details_Id_,
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
