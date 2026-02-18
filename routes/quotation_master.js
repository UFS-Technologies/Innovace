const express          = require('express');
const router           = express.Router();
const path             = require('path');
const fs               = require('fs');

const quotation_master = require('../models/quotation_master');       // ← adjust path
const { generateQuotationPdf } = require('../utils/quotation_pdf_generator'); // ← adjust path
const db = require('../dbconnection');

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
router.get('/Get_quotation_master_pdf', async function (req, res) {
  try {
    const quotationId = req.query.quotation_master_id;

    if (!quotationId) {
      return res.status(400).json({
        success: false,
        error: 'quotation_master_id query param is required'
      });
    }

    // ── 1. Fetch quotation master via same SP as existing route ──────────────
    quotation_master.Get_quotation_master(quotationId, async (err, rows) => {
      if (err) {
        console.error('[PDF] DB error:', err);
        return res.status(500).json({ success: false, error: err.message });
      }

      if (!rows || !rows[0] || !rows[0][0]) {
        return res.status(404).json({ success: false, error: 'Quotation not found' });
      }

      // raw = the object exactly as shown in the JSON sample
      const raw = rows[0][0];

      // ── 2. Fetch customer from lead table using Customer_Id ────────────────
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
              `SELECT Customer_Name, address, Address3,Contact_Number, Email
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

      // ── 3. Parse JSON array fields safely ─────────────────────────────────
      function safeJson(val) {
        if (!val) return [];
        if (Array.isArray(val)) return val;
        try { return JSON.parse(val); } catch { return []; }
      }

      // Attach parsed arrays back onto raw so the generator can read them
      raw.quotation_details = safeJson(raw.quotation_details);
      raw.bill_of_materials = safeJson(raw.bill_of_materials);
      raw.production_chart  = safeJson(raw.production_chart);

      // ── 4. Generate PDF ────────────────────────────────────────────────────
      try {
        const pdfBuffer = await generateQuotationPdf(raw, customer);

        if (!pdfBuffer || pdfBuffer.length === 0) {
          throw new Error('PDF buffer is empty');
        }

        // Build a clean filename
        const safeCustomer = (customer.Customer_Name || 'Customer')
          .replace(/[^a-zA-Z0-9]/g, '_')
          .substring(0, 30);
        const filename = `Quotation_${quotationId}_${safeCustomer}_${Date.now()}.pdf`;

        res.setHeader('Content-Type',        'application/pdf');
        res.setHeader('Content-Disposition', `attachment; filename="${filename}"`);
        res.setHeader('Content-Length',       pdfBuffer.length);
        res.send(pdfBuffer);

        console.log(`[PDF] ✓ Sent: ${filename}`);

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
