var express = require("express");
var router = express.Router();
var processFlow = require("../models/process_flow");

router.post("/Save_Process_Flow", function (req, res, next) {
  try {
    processFlow.Save_Process_Flow(req.body, function (err, rows) {
      if (err) {
        res.json({ Error: 1, Message: "Database Error", Details: err.message });
      } else {
        // Extract just the first result row
        const result = rows[0][0]; // ✅ This is what you want: { Error, Message, Flow_Id }
        res.json(result);
      }
    });
  } catch (e) {
    res.json({ Error: 1, Message: "Unexpected Error", Details: e.message });
  }
});

// Delete_Process_Flow_By_Id
router.post("/Delete_Process_Flow_By_Id", function (req, res, next) {
  try {
    const { flow_id } = req.body;

    if (!flow_id) {
      return res.json({ Error: 1, Message: "Missing required field: flow_id" });
    }

    processFlow.Delete_Process_Flow_By_Id(flow_id, function (err, rows) {
      if (err) {
        res.json({ Error: 1, Message: "Database Error", Details: err.message });
      } else {
        const result = rows[0]; // Extract single result row
        res.json({success: true, message: "Process Flow Deleted Successfully" });
      }
    });
  } catch (e) {
    res.json({ Error: 1, Message: "Unexpected Error", Details: e.message });
  }
});

router.get("/get_all_dropDown_processFlow", function (req, res, next) {
  try {
    processFlow.get_all_dropDown_processFlow(function (err, rows) {
      if (err) {
        console.log("err: ", err);
        res.status(500).json({ success: false, error: err });
      } else {
        res.status(200).json({
          success: true,
          data: {
            task_type: rows[0],
            task_type_status: rows[1],
            department: rows[2],
            branch: rows[3],
            document: rows[4],
          },
        });
      }
    });
  } catch (e) {
    res.status(500).json({ success: false, error: e.message });
  }
});
router.delete("/Delete_Process_Flow/:flowId", (req, res) => {
  const { flowId } = req.params;

  processFlow.Delete_Process_Flow(flowId, (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Failed to delete process flow", error: err });
    }
    res
      .status(200)
      .json({ message: result[0].message || "Deleted successfully" });
  });
});
router.get("/Get_Process_Flow_By_Id/:flowId", (req, res) => {
  const flowId = req.params.flowId;
  processFlow.Get_Process_Flow_By_Id(flowId, (err, result) => {
    if (err) {
      console.error("Error fetching process flow:", err);
      return res
        .status(500)
        .json({ success: false, message: "Internal server error" });
    }

    if (!result || result[0].length === 0) {
      return res.status(404).json({ message: "Process Flow not found" });
    }

    const jsonData = result[0][0].data; // clean direct access

    res.status(200).json({ success: true, data: jsonData });
  });
});
router.get("/Get_All_Process_Flow", (req, res) => {
  processFlow.Get_All_Process_Flow((err, result) => {
    if (err) {
      console.error("Error fetching all process flows:", err);
      return res
        .status(500)
        .json({ success: false, message: "Internal server error" });
    }

    if (!result || result.length === 0) {
      return res.status(404).json({ message: "No process flows found" });
    }

    res.status(200).json({ success: true, data: result[0] });
  });
});

router.get("/Get_Task_Types_Of_Process_Flow", (req, res) => {
  const task = req.query;
  processFlow.Get_Task_Types_Of_Process_Flow(task, (err, result) => {
    if (err) {
      console.error("Error fetching Task Types Of Process Flow:", err);
      return res
        .status(500)
        .json({ success: false, message: "Internal server error" });
    }

    if (!result || result.length === 0) {
      return res
        .status(404)
        .json({ message: "No Task Types Of Process Flow found" });
    }

    // console.log("result", result);
    
    res.status(200).json({ success: true, data: result[0],
      document_types: result[1], 
      mandatory_status: result[2],
    });

    
  });
});

router.get("/Get_Task_Type_Of_Department/:Department_Id", (req, res) => {
  const {Department_Id} = req.params;
  processFlow.Get_Task_Type_Of_Department(Department_Id, (err, result) => {
    if (err) {
      console.error("Error fetching Task Types Of Department:", err);
      return res
        .status(500)
        .json({ success: false, message: "Internal server error" });
    }

    if (!result || result.length === 0) {
      return res
        .status(404)
        .json({ message: "No Task Types Of Department found" });
    }

    res.status(200).json({ success: true, data: result[0] });

    
  });
});
module.exports = router;
