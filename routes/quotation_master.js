const express          = require('express');
const router           = express.Router();
const path             = require('path');
const fs               = require('fs');

const quotation_master = require('../models/quotation_master');       // ← adjust path
const { generateQuotationPdf, normalizeQuotationPayload } = require('../utils/quotation_pdf_generator'); // ← adjust path

const db = require('../dbconnection');
router.post("/save_template", (req, res) => {

  const templateData = req.body;

  quotation_master.Save_template_master(templateData, (err, result) => {

    if (err) {
      console.error("Route Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error"
      });
    }

    res.json({
      success: true,
      data: result[0][0]   // SP SELECT output
    });

  });

});
router.get("/get_template", (req, res) => {

 quotation_master.Get_template_master((err, result) => {

    if (err) {
      console.error(err);
      return res.status(500).json({
        success: false,
        message: "Database error"
      });
    }

    res.json({
      success: true,
      data: result[0]
    });

  });

});
router.post("/update_template", (req, res) => {

  const data = {
    template_id: req.body.template_id,
    template_name: req.body.template_name
  };

  quotation_master.Update_Template(data, (err, result) => {

    if (err) {
      console.error("Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error"
      });
    }

    res.json({
      success: true,
      message: "Template updated successfully",
      data: result[0]
    });

  });

});
router.delete("/delete_template/:template_id", (req, res) => {

  const template_id = req.params.template_id;

  quotation_master.Delete_Template(template_id, (err, result) => {

    if (err) {
      console.error("Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error"
      });
    }

    res.json({
      success: true,
      message: "Template deleted successfully"
    });

  });

});
router.get("/load_by_template/:template_id", (req, res) => {

  const template_id = req.params.template_id;

    quotation_master.Load_Quotation_By_Template(template_id, (err, result) => {

    if (err) {
      console.error("Error:", err);
      return res.status(500).json({
        success: false,
        message: "Database error"
      });
    }

    res.json({
      success: true,
      data: result
    });

  });

});
router.post("/Save_quotation_master/", function (req, res, next) {
  try {
    console.log("REQ BODY (raw):", JSON.stringify(req.body, null, 2));
 
    // Normalize: converts <b>/<span style="color:red"> etc. → [b]/[red] bracket tags
    // Works on: Description, Terms_And_Conditions, Payment_Term_Description,
    //           Subject, KindAttn, Warranty, and ItemName inside quotation_details
    const { master } = normalizeQuotationPayload(req.body);
 
    console.log("REQ BODY (normalized):", JSON.stringify(master, null, 2));
 
    quotation_master.Save_quotation_master(master, function (err, rows) {
      if (err) {
        console.error("SP ERROR:", err);
        return res.json(err);
      }
 
      console.log("RAW SP RESPONSE:", JSON.stringify(rows, null, 2));
 
      if (rows && rows[0] && rows[0].length > 0) {
        console.log("FINAL RESPONSE:", rows[0][0]);
        res.json(rows[0][0]);
      } else {
        console.log("NO DATA RETURNED FROM SP");
        res.json({
          success: false,
          message: "No data returned from stored procedure",
          data: rows
        });
      }
    });
  } catch (e) {
    console.error("CATCH ERROR:", e);
    res.json(e);
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
router.get('/Get_quotation_master_pdf', async function (req, res) {
  try {
    const quotationId = req.query.quotation_master_id;

    if (!quotationId) {
      return res.status(400).json({
        success: false,
        error: 'quotation_master_id query param is required'
      });
    }

    quotation_master.Get_quotation_master(quotationId, async (err, rows) => {
      if (err) {
        console.error('[PDF] DB error:', err);
        return res.status(500).json({ success: false, error: err.message });
      }

      if (!rows || !rows[0] || !rows[0][0]) {
        return res.status(404).json({ success: false, error: 'Quotation not found' });
      }

      const raw = rows[0][0];

      let customer = {
        Customer_Name:  '',
        address:        '',
        Address3:       '',
        Contact_Number: '',
        Email:          '',
      };

      if (raw.Customer_Id) {
        try {
          customer = await new Promise((resolve, reject) => {
            db.query(
              `SELECT Customer_Name, address, Address3, Contact_Number, Email
               FROM \`lead\`
               WHERE Customer_Id = ?
               LIMIT 1`,
              [raw.Customer_Id],
              (qErr, results) => {
                if (qErr) reject(qErr);
                else resolve(results && results[0] ? results[0] : customer);
              }
            );
          });
        } catch (fetchErr) {
          console.warn('[PDF] Could not fetch customer details:', fetchErr.message);
        }
      }

      function safeJson(val) {
        if (!val) return [];
        if (Array.isArray(val)) return val;
        try { return JSON.parse(val); } catch { return []; }
      }

      raw.quotation_details = safeJson(raw.quotation_details);
      raw.bill_of_materials = safeJson(raw.bill_of_materials);
      raw.production_chart  = safeJson(raw.production_chart);

      try {
        const pdfBuffer = await generateQuotationPdf(raw, customer);

        if (!pdfBuffer || pdfBuffer.length === 0) {
          throw new Error('PDF buffer is empty');
        }

        const safeCustomer = (customer.Customer_Name || 'Customer')
          .replace(/[^a-zA-Z0-9]/g, '_')
          .substring(0, 30);
        const filename = `Quotation_${quotationId}_${safeCustomer}_${Date.now()}.pdf`;

        res.setHeader('Content-Type',        'application/pdf');
        res.setHeader('Content-Disposition', `attachment; filename="${filename}"`);
        res.setHeader('Content-Length',       pdfBuffer.length);
        res.send(pdfBuffer);

        console.log(`[PDF] Sent: ${filename}`);

      } catch (pdfErr) {
        console.error('[PDF] Generation failed:', pdfErr);
        if (!res.headersSent) {
          res.status(500).json({ success: false, error: pdfErr.message });
        }
      }
    });

  } catch (e) {
    console.error('[PDF] Route error:', e);
    if (!res.headersSent) {
      res.status(500).json({ success: false, error: 'Internal server error' });
    }
  }
});


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
