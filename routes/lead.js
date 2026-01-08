var express = require("express");
var router = express.Router();
var lead = require("../models/lead");
const jwtMiddleware = require('../helpers/jwt');

router.post("/Save_lead/", function (req, res, next) {
  console.log("req.user id is ", req.User_Details_Id || req.user.id);
  console.log("The datas that are coming is", req.body)
  console.log('req.body.customFields,: ', req.body.customFields,);
  console.log('req.body.lead.customFields: ', req.body.lead.customFields);
  try {
    lead.Save_lead(
      req.body.lead,
      req.body.followup,
      req.User_Details_Id,
      req.body.lead.customFields,
      req.body.lead.enquiryForCustomFields,

      function (err, rows) {
        if (err) {
          console.error("Error saving lead:", err);
          res.status(500).json({ message: "Failed to save lead" });
        } else {
          res.json(rows[0][0]);
        }
      }
    );
  } catch (e) {
    console.error("Exception caught:", e);
    res.status(500).json({ message: "Server error" });
  }
});

// Get_Lead_Report_By_Enquiry_Source
router.get("/Get_Lead_Report_By_Enquiry_Source/", function (req, res, next) {
  try {
    const { from_date = "", to_date = "" } = req.query;

    lead.Get_Lead_Report_By_Enquiry_Source(
      from_date,
      to_date,
      req.User_Details_Id,
      function (err, rows) {
        if (err) {
          console.log("err: ", err);

          res.json(err);
        } else {
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
    console.error("Error in route: ", e);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

router.get("/Search_lead/", function (req, res, next) {
  try {

    console.log("req.query: ", req.User_Details_Id);
    lead.Search_lead(
      req.query.lead_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.To_User_Id,
      req.User_Details_Id,
      req.query.Status_Id,
      req.query.Page_Index1,
      req.query.Page_Index2,
      req.query.Enquiry_For_Id,
      req.User_Details_Id,

      function (err, rows) {
        if (err) {
          console.log(err);
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

router.get("/Search_Customer/", function (req, res, next) {
  try {
    console.log("req.query: ", req.User_Details_Id);
    lead.Search_Customer(
      req.query.Customer_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.To_User_Id,
      req.query.Status_Id,
      req.query.Page_Index1,
      req.query.Page_Index2,
      req.User_Details_Id,
      function (err, rows) {
        if (err) {
          console.log(err);
          res.json(err);
        } else {
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
    console.log(e);
  } finally {
  }
});

router.get("/Get_lead/:Customer_Id?", function (req, res, next) {
  try {
    lead.Get_lead(req.query.Customer_Id, function (err, rows) {
      if (err) {
        console.log("err: ", err);
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});
router.get("/Get_City_Fire_Station_by_DistrictId/:District_Id", function (req, res) {
  lead.Get_City_Fire_Station_by_DistrictId(req.params.District_Id, function (err, rows) {
    if (err) {
      console.log("Error: ", err);
      res.json(err);
    } else {
      res.json({
        Cities: rows[0],
        FireStations: rows[1]
      });
    }
  });
});


router.delete("/Delete_lead/:lead_Id_?", function (req, res, next) {
  try {
    lead.Delete_lead(req.params.lead_Id_, function (err, rows) {
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

router.get("/Search_Enquiry_Source/", function (req, res, next) {
  try {
    lead.Search_Enquiry_Source(
      req.query.Enquiry_Source_Name,
      function (err, rows) {
        if (err) {
          console.log('<<<<<<<<<<<', err)
          res.json(err);
        } else {
          console.log(',,,,,,,', rows)
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
  } finally {
  }
});

router.get("/Get_FollowUp_History/", function (req, res, next) {
  try {
    lead.Get_FollowUp_History(req.query.Customer_Id, function (err, rows) {
      if (err) {
        console.log(err);
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.get("/Search_lead_Report/", function (req, res, next) {
  try {
    lead.Search_lead_Report(
      req.query.lead_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.To_User_Id,
      req.query.Status_Id,
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

router.get("/Search_Pending_Followup_Report/", function (req, res, next) {
  try {
    lead.Search_Pending_Followup_Report(
      req.query.lead_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.To_User_Id,
      req.query.Status_Id,
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
router.get("/Search_Warranty_Report/", function (req, res, next) {
  try {
    lead.Search_Warranty_Report(
      req.query.Customer_Name,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,

      function (err, rows) {
        if (err) {
          res.json({
            success: false,
            message: "Error fetching warranty report",
            error: err,
          });
        } else {
          res.json({ success: true, data: rows[0] });
        }
      }
    );
  } catch (e) {
    res.json({ success: false, message: "Exception occurred", error: e });
  }
});

router.get("/Get_Dashboard_Count/", function (req, res, next) {
  try {
    lead.Get_Dashboard_Count(
      req.User_Details_Id,
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date,
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
// router.get('/Get_Organization', function (req, res, next) {
//   lead.Get_Organization(function (err, rows) {
//     if (err) {
//       console.error("Error fetching organizations:", err);
//       res.status(500).json({ message: "Failed to fetch organizations" });
//     } else {
//       res.json(rows[0]);
//     }
//   });
// });
router.get('/Get_engineer_details', (req, res) => {
  const {
    Search,
    District_Id,
    Department_Id,
    Association_Name,
    Page_Index1,
    Page_Index2
  } = req.query;

  lead.Get_engineer_details(
    Search || '',
    parseInt(District_Id) || 0,
    parseInt(Department_Id) || 0,
    Association_Name || '',
    parseInt(Page_Index1) || 1,
    parseInt(Page_Index2) || 25,
    (err, rows) => {
      if (err) {
        console.error('Error fetching engineer details:', err);
        return res.status(500).json({
          message: 'Failed to fetch engineer details',
          error: err
        });
      }

      // SP returns multiple result sets (data + count)
      res.json(rows && rows.length > 0 ? rows[0] : []);
    }
  );
});





router.get('/Search_engineers', (req, res) => {
  console.log("🚀 Route hit: /Search_engineers");

  const filters = {
    Status_Id: req.query.Status_Id ? parseInt(req.query.Status_Id) : null,
    From_Date: req.query.From_Date || null,
    To_Date: req.query.To_Date || null,
    To_Staff_Id: req.query.To_Staff_Id ? parseInt(req.query.To_Staff_Id) : null, // <- corrected
    Engineer_Name_Phone: req.query.Engineer_Name_Phone || null,
    Page_Start: req.query.Page_Start ? parseInt(req.query.Page_Start) : 1,
    Page_End: req.query.Page_End ? parseInt(req.query.Page_End) : 10
  };

  console.log("Filters:", filters);

  lead.Search_engineers(filters, (err, rows) => {
    if (err) {
      console.error("DB Error:", err);
      return res.status(500).json({ success: false, message: "Failed to fetch engineers", error: err });
    }

    res.json({
      success: true,
      message: "Engineers fetched successfully",
      data: rows[0]
    });
  });
});

// router.get('/get_association', (req, res) => {
//   lead.Get_Association((err, rows) => {
//     if (err) {
//       console.error('Error fetching associations:', err);
//       return res.status(500).json({ message: 'Failed to fetch associations' });
//     }
//     res.json(rows[0]); // Return array of associations
//   });
// });
router.post('/Save_customer_master', (req, res) => {
  console.log("Received body:", req.body);  // 🔍 Check data from client
  lead.Save_customer_master(req.body, (err, rows) => {
    if (err) {
      console.error('Error saving customer master:', err);
      return res.status(500).json({ message: 'Failed to save customer master' });
    }
    console.log("DB result:", rows);
    res.json(rows[0][0]);
  });
});
router.get('/Get_customer_master', (req, res) => {
  lead.Get_customer_master((err, rows) => {
    if (err) {
      console.error('Error fetching customer master:', err);
      return res.status(500).json({ message: 'Failed to fetch customer master' });
    }

    res.json(rows[0]); // Returns array of customers
  });
});
router.get('/Search_customer_master/:name?/:phone?', (req, res) => {
  const name = req.params.name || '';
  const phone = req.params.phone || '';

  lead.Search_customer_master({ customer_master_name: name, phone_number: phone }, (err, rows) => {
    if (err) {
      console.error('Error searching customer master:', err);
      return res.status(500).json({ message: 'Failed to search customer master' });
    }

    res.json(rows[0]); // Returns matching customers
  });
});
router.delete('/Delete_customer_master/:customer_master_id?', function (req, res, next) {
  try {
    lead.Delete_customer_master(req.params.customer_master_id, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);  // Returns the result from SP
      }
    });
  } catch (e) {
    console.error('Error in deleting customer master:', e);
    res.status(500).json({ message: 'Internal server error' });
  }
});
router.get('/Get_Engineer_Department', function (req, res, next) {
  try {
    lead.Get_Engineer_Department(
      req.query.Engineer_Department_Name,
      function (err, result) {
        if (err) {
          res.status(500).json({
            success: false,
            message: 'Failed to get engineer department',
            error: err,
          });
        } else {
          res.json({
            success: true,
            message: 'Engineer department fetch successful',
            data: result,
          });
        }
      }
    );
  } catch (e) {
    res.status(500).json({
      success: false,
      message: 'Internal server error',
      error: e.message,
    });
  }
});





router.post('/Save_engineers', jwtMiddleware(), (req, res) => {
  console.log("🚀 Route hit: /Save_engineers");

  const userId = req.User_Details_Id; // From token
  console.log("User ID from token:", userId);

  const data = req.body;
  data.User_Id = userId; // Pass user id to model

  console.log("Request body for DB:", data);

  lead.Save_engineers(data, (err, rows) => {
    if (err) {
      console.error("DB Error:", err);
      return res.status(500).json({ message: 'Failed to save engineer', error: err });
    }

    console.log("DB result:", rows);

    res.json({
      message: "Engineer saved successfully",
      engineer_id: rows[0][0].Engineers_Id
    });
  });
});

router.delete('/Delete_engineers/:engineers_Id_?', function (req, res, next) {
  try {
    lead.Delete_engineers(req.params.engineers_Id_, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);  // same style as Delete_amc
      }
    });
  } catch (e) {
    // optional: log the error
  } finally {
    // optional cleanup
  }
});


router.get("/Enquiry_Source_Conversion_Report/", function (req, res, next) {
  try {
    lead.Enquiry_Source_Conversion_Report(
      req.User_Details_Id,
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
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

router.get("/Enquiry_Source_Summary_Report/", function (req, res, next) {
  try {
    lead.Enquiry_Source_Summary_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
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

router.get("/Lead_Progress_Report/", function (req, res, next) {
  try {
    lead.Lead_Progress_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
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

router.get("/Customer_Work_Summary/", function (req, res, next) {
  try {
    lead.Customer_Work_Summary(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
      req.User_Details_Id,
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

router.get("/Enquiry_For_Report/", function (req, res, next) {
  try {
    lead.Enquiry_For_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
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

router.get("/Conversion_Report/", function (req, res, next) {
  try {
    lead.Conversion_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
      req.query.Enquiry_For_Id,
      req.query.Registered_By,
      req.query.Customer_Name,
      req.query.Status_Id,
      req.User_Details_Id,
      function (err, rows) {
        if (err) {
          console.log(err);
          res.json(err);
        } else {
          // console.log(rows[0])
          res.json(rows[0]);
        }
      }
    );
  } catch (e) {
    console.log(e);
  } finally {
  }
});

router.put("/Update_Customer/", function (req, res, next) {
  try {
    lead.Update_Customer(req.body, function (err, rows) {
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
router.get('/engineer_enquiry_source', (req, res) => {
  lead.Get_Engineer_Enquiry_Source((err, rows) => {
    if (err) {
      console.error("DB Error:", err);
      return res.status(500).json({
        success: false,
        message: "Failed to fetch engineer enquiry sources",
        error: err
      });
    }

    res.json({
      success: true,
      message: "Engineer enquiry sources fetched successfully",
      data: rows[0]
    });
  });
});

router.post("/Save_Enquiry_Source/", function (req, res, next) {
  try {
    lead.Save_Enquiry_Source(req.body, function (err, rows) {
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

router.delete(
  "/Delete_Enquiry_Source/:Enquiry_Source_Id_?",
  function (req, res, next) {
    try {
      lead.Delete_Enquiry_Source(
        req.params.Enquiry_Source_Id_,
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

router.get("/Search_Enquiry_For/", function (req, res, next) {
  try {
    lead.Search_Enquiry_For(req.query.Enquiry_For_Name, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.get("/Search_Checklist/", function (req, res, next) {
  try {
    lead.Search_Checklist(req.query.Checklist_Name_, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.post("/Save_Enquiry_For/", function (req, res, next) {
  console.log("<<<<<<<<<<", req.body)
  try {
    lead.Save_Enquiry_For(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        console.log(rows)
        res.json(rows[0][0]);

      }
    });
  } catch (e) {
  } finally {
  }
});

router.post("/Save_Checklist/", function (req, res, next) {
  try {
    lead.Save_Checklist(req.body, function (err, rows) {
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

router.delete(
  "/Delete_Enquiry_For/:Enquiry_For_Id_?",
  function (req, res, next) {
    try {
      lead.Delete_Enquiry_For(req.params.Enquiry_For_Id_, function (err, rows) {
        if (err) {
          res.json(err);
        } else {
          res.json(rows[0][0]);
        }
      });
    } catch (e) {
    } finally {
    }
  }
);

router.delete("/Delete_Checklist/:Checklist_Id?", function (req, res, next) {
  try {
    lead.Delete_Checklist(req.params.Checklist_Id, function (err, rows) {
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

router.get("/Search_Invoice_Report/", function (req, res, next) {
  try {
    lead.Search_Invoice_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
      req.query.Customer_Name,
      req.query.Is_Balance_Check,
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

router.get("/Search_Receipt_Report/", function (req, res, next) {
  try {
    lead.Search_Receipt_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
      req.query.Customer_Name,
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

router.get("/Search_Feasibility_Report/", function (req, res, next) {
  try {
    lead.Search_Feasibility_Report(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
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

router.get("/Task_Allocation_Summary/", function (req, res, next) {
  try {
    lead.Task_Allocation_Summary(
      req.query.Fromdate,
      req.query.Todate,
      req.query.Is_Date_Check,
      req.User_Details_Id,
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
router.post("/Import_Engineer", function (req, res, next) {
  try {
    lead.Import_Engineer(req.body, function (err, rows) {
      if (err) {
        console.error("Engineer Import Error:", err);
        res.status(500).json({ success: false, message: "Import failed", error: err });
      } else {
        res.json({ success: true, message: "Engineers imported successfully", data: rows });
      }
    });
  } catch (e) {
    res.status(500).json({ success: false, message: e.message });
  }
});

router.post("/Lead_Import/", function (req, res, next) {
  try {
    lead.Lead_Import(req.body, function (err, rows) {
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

router.post("/Save_Image/", function (req, res, next) {
  try {
    lead.Save_Image(req.body, req.body.User_Details_Id, function (err, rows) {
      console.log("req.body.User_Details_Id: ", req.body.User_Details_Id);
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

router.delete("/Delete_image/:Images_Id_?", function (req, res, next) {
  try {
    lead.Delete_image(req.params.Images_Id_, function (err, rows) {
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

router.get("/Get_Images_By_Customer/", function (req, res, next) {
  try {
    lead.Get_Images_By_Customer(req.query.Customer_Id, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.put("/Remove_Registration/", function (req, res, next) {
  try {
    lead.Remove_Registration(req.query.Customer_Id, function (err, rows) {
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

router.get("/Get_Lead_Dropdown/", function (req, res, next) {
  try {
    lead.Get_Lead_Dropdown(function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        const result = {
          panel_type: rows[0],
          roof_type: rows[1],
          subsidy_type: rows[2],
          cost_includes: rows[3],
          amount_paid_through: rows[4],
          phase: rows[5],
          work_type: rows[6],
          inverter_type: rows[7],
        };
        res.json(result);
      }
    });
  } catch (e) {
  } finally {
  }
});

//Stage APIs

router.post("/Save_Stage/", function (req, res, next) {
  try {
    lead.Save_Stage(req.body, function (err, rows) {
      if (err) {
        console.log("This is the", err);
        res.json({
          success: false,
          message: "Failed to save stage",
        });
      } else {
        res.json({
          success: true,
          message:
            req.body.Stage_Id > 0
              ? "Stage updated successfully."
              : "Stage added successfully.",
          Result: rows[0][0],
        });
      }
    });
  } catch (e) {
    console.log("Unexpected error:", e);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
});

router.get("/Get_All_Stage/", function (req, res, next) {
  try {
    lead.Get_All_Stage(req.query.Stage_Name, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.delete("/Delete_Stage/:Stage_Id_?", function (req, res, next) {
  try {
    lead.Delete_Stage(req.params.Stage_Id_, function (err, rows) {
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

//Source Category routes.

router.post("/Save_Source_Category/", function (req, res, next) {
  try {
    lead.Save_Source_Category(req.body, function (err, rows) {
      if (err) {
        console.log("This is the", err);
        res.json({
          success: false,
          message: "Failed to save stage",
        });
      } else {
        res.json({
          success: true,
          message:
            req.body.Source_Category_Id > 0
              ? "Source_Category updated successfully."
              : "Source_Category added successfully.",
          Result: rows[0][0],
        });
      }
    });
  } catch (e) {
    console.log("Unexpected error:", e);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
});

router.get("/Get_All_Source_Category/", function (req, res, next) {
  try {
    lead.Get_All_Source_Category(req.query.Source_Category_Name, function (err, rows) {
      if (err) {
        res.json(err);
      } else {
        res.json(rows[0]);
      }
    });
  } catch (e) {
  } finally {
  }
});

router.delete("/Delete_Source_Category/:Source_Category_Id_?", function (req, res, next) {
  try {
    lead.Delete_Source_Category(req.params.Source_Category_Id_, function (err, rows) {
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

//Just fetching districts

router.get("/Get_Districts", function (req, res) {
  lead.Get_Districts(function (err, rows) {
    if (err) {
      res.status(500).json({ success: false, message: "Database error", error: err });
    } else {
      res.json({ success: true, data: rows[0] });
    }
  });
});


router.get("/Get_CustomFields_On_EnquirySource", function (req, res, next) {
  try {
    lead.Get_CustomFields_On_EnquirySource(
      req.query.enquiry_source_id,
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

router.get("/Get_CustomFields_On_EnquiryFor", function (req, res, next) {
  console.log("ggggggggg", req.query)
  try {
    lead.Get_CustomFields_On_EnquiryFor(
      req.query.enquiry_for_id,
      req.query.lead_id,
      function (err, rows) {
        if (err) {
          res.json(err);
          console.log("err: ", err);
        } else {
          res.json(rows[0]); // return first result set
          console.log("rows[0]dddd: ", rows[0]);
        }
      }
    );
  } catch (e) {
    console.log("e: ", e);
    res.status(500).json({ message: "Unhandled error", error: e.toString() });
  }
});



module.exports = router;
