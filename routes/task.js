var express = require("express");
var router = express.Router();
var task = require("../models/task");
var feedback = require("../models/feedback");
const { sendNotifToTopicRestAPI } = require("../helpers/firebase.js");

const socketManager = require("../socket"); // Import socket manager

// Save Task
router.post("/Save_task/", async function (req, res) {
  try {
    console.log("📩 Request Headers:", req.headers);
    console.log("📝 Save_task req.body", req.body);

    task.Save_task(req.body, async function (err, rows) {
      if (err) {
        console.error("❌ Error in Save_task:", err);
        return res
          .status(500)
          .json({ error: "Task save failed", details: err });
      }

      const savedTask = rows[0][0];
      const menu_id = req.headers.menuid || 0;
      console.log("✅ Task saved with ID:", savedTask.Task_Master_Id_);

      const notificationTitle = "Task Created";
      const notificationBody = `A New ${req.body["Task_Type_Name"]} Task has Been Created`;

      const taskUsers = req.body["Task_user"];

      try {
        for (const user of taskUsers) {
          const User_Id = user.User_Details_Id;
          const Created_On = new Date().toISOString();
          const topic = `Solaris-${User_Id}`;
          const socketRoom = `user-${User_Id}`;

          // First, save to DB and get Notification_Id
          const Notification_Id = await new Promise((resolve, reject) => {
            console.log("📥 Saving notification to DB...");

            task.Save_notification(
              {
                title: notificationTitle,
                body: notificationBody,
                Task_Master_Id: savedTask.Task_Master_Id_,
                User_Details_Id: User_Id,
                Menu_Id: menu_id,
                Created_On: Created_On,
              },
              (err, result) => {
                if (err) {
                  console.error(
                    "📛 DB notification insert failed:",
                    err.message
                  );
                  return reject(err);
                }
                console.log("📥 result", result);

                const insertedId = result?.[0]?.[0]?.Notification_Id;
                console.log("📥 Notification saved with ID:", insertedId);

                resolve(insertedId);
              }
            );
          });

          // Build notification with inserted ID
          const notification = {
            Notification_Id: Notification_Id,
            Title: notificationTitle,
            Body: notificationBody,
            Master_Id: savedTask.Task_Master_Id_,
            Menu_Id: menu_id,
            User_Id: User_Id,
            Created_At: Created_On,
          };

          console.log(
            `📢 Notifying user: ${User_Id} with Notification_Id: ${Notification_Id}`
          );

          // Emit to user via socket with full notification object
          socketManager.io.to(socketRoom).emit("notification", {
            notification,
            data: req.body,
          });

          // Only send FCM if the user is NOT connected via socket
          const roomSockets =
            socketManager.io.sockets.adapter.rooms.get(socketRoom);
          const isUserConnected = roomSockets && roomSockets.size > 0;

          // if (!isUserConnected) {
          await sendNotifToTopicRestAPI(
            topic,
            notificationTitle,
            notificationBody,
            { new: "s" }
          );
          // } else {
          //   console.log(`🔌 User ${User_Id} is connected. Skipping FCM push.`);
          // }
        }
      } catch (notificationError) {
        console.error("🚨 Notification error:", notificationError.message);
      }

      // ✅ Always send response
      return res.json(savedTask);
    });
  } catch (e) {
    console.error("🔥 Unexpected server error:", e.message);
    return res.status(500).json({ error: "Internal Server Error" });
  }
});

// Fetch Notification by UserId
router.get("/Get_Notifications_By_UserId/", function (req, res, next) {
  try {
    console.log("req.query: ", req.query);
    if (!req.query.User_Details_Id) {
      return res.status(400).json({ error: "UserId is required" });
    }

    task.Get_Notifications_By_UserId(
      req.query.User_Details_Id,
      function (err, rows) {
        if (err) {
          res.status(500).json({ error: "Database error", details: err });
        } else {
          res.json(rows[0]); // rows[0] contains actual result set
        }
      }
    );
  } catch (e) {
    console.error("Unhandled error:", e.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.get("/Search_task/", function (req, res, next) {
  try {
    console.log("req.query: ", req.query);

    task.Search_task(
      req.query.Customer_Name,
      req.query.Task_Status_Id,
      req.query.To_User,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.User_Details_Id, // 👈 Add this
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

router.get("/Search_task_by_customer/", function (req, res, next) {
  try {
    console.log("===== API HIT: Search_task_by_customer =====");
    console.log("Query Params:", req.query);
    console.log("Login User (req.User_Details_Id):", req.User_Details_Id);

    console.log("Calling SP with values:", {
      Customer_Name: req.query.Customer_Name,
      Task_Status_Id: req.query.Task_Status_Id,
      To_User: req.query.To_User,
      Is_Date: req.query.Is_Date,
      Fromdate: req.query.Fromdate,
      Todate: req.query.Todate,
      Task_Type_Id: req.query.Task_Type_Id,
      Page_Index: req.query.Page_Index,
      PageSize: req.query.PageSize,
      Login_User: req.User_Details_Id
    });

    task.Search_task_by_customer(
      req.query.Customer_Name,
      req.query.Task_Status_Id,
      req.query.To_User,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.Task_Type_Id,
      req.query.Page_Index,
      req.query.PageSize,
      req.User_Details_Id,
      function (err, rows) {

        console.log("===== SP RESPONSE =====");

        if (err) {
          console.log("SP ERROR:", err);
          return res.json(err);
        }

        console.log("Raw rows:", rows);
        console.log("Rows[0] (Tasks):", rows?.[0]);
        console.log("Rows[1] (Meta):", rows?.[1]);

        const response = {
          data: rows?.[0] || [],
          metadata: {
            Total_Items: rows?.[1]?.[0]?.Total_Items || 0,
            Total_Pages: rows?.[1]?.[0]?.Total_Pages || 0,
            All_Total_Items: rows?.[1]?.[0]?.All_Total_Items || 0,
          },
        };

        console.log("Final Response Sent:", response);
        res.json(response);
      }
    );
  } catch (e) {
    console.log("UNEXPECTED ERROR:", e);
    res.json({ error: "An unexpected error occurred." });
  }
});


router.get("/Search_task_Report/", function (req, res, next) {
  try {
    task.Search_task_Report(
      req.query.Customer_Name,
      req.query.Task_Status_Id,
      req.query.To_User,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
      req.query.Task_Type_Id,
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
router.get("/Get_task/:task_Id_?", function (req, res, next) {
  try {
    task.Get_task(req.params.task_Id_, function (err, rows) {
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

router.get("/Get_Task_Users/:Task_Master_Id_?", function (req, res, next) {
  try {
    task.Get_Task_Users(req.params.Task_Master_Id_, function (err, rows) {
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

router.get("/Get_task_mobile/:task_Id_?", function (req, res, next) {
  try {
    task.Get_task_mobile(req.params.task_Id_, function (err, rows) {
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

router.delete("/Delete_task/:task_Id_?", function (req, res, next) {
  try {
    task.Delete_task(req.params.task_Id_, function (err, rows) {
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
router.post("/Task_Start_Button_click/", function (req, res, next) {
  try {
    task.Task_Start_Button_click(req.body, function (err, rows) {
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
router.post("/Task_Complete_Button_Click/", function (req, res, next) {
  try {
    task.Task_Complete_Button_Click(req.body, function (err, rows) {
      if (err) {
        return res.json(err);
      }
      if (req.body.needFeedback == 1) {
        const jwt = require("jsonwebtoken");
        const JWT_SECRET = "SolarisbackendOtpSent";
        const BASE_URL = process.env.FEEDBACK_URL || "https://yourdomain.com";

        const Task_Id = req.body.Task_Id;
        const Customer_Id = req.body.Customer_Id;
        const payload = {
          Task_Id: Task_Id,
          Customer_Id: Customer_Id,
          iat: Math.floor(Date.now() / 1000),
          ...(req.body.additionalData || {}),
        };

        // Sign token with expiration
        const token = jwt.sign(payload, JWT_SECRET, {
          expiresIn: "24h",
          algorithm: "HS256",
        });
        // jwt.verify(token, JWT_SECRET, function(err, decoded) {
        //   if (err) {
        //     return res.status(401).json({
        //       success: false,
        //       message: 'Invalid token',
        //       error: err.message
        //     });
        //   }

        //   // Return the decoded token payload
        //   return res.json({
        //     success: true,
        //     message: 'Token verified successfully',
        //     data: decoded
        //   });
        // });
        const feedbackLink = `${BASE_URL}/feedback?token=${encodeURIComponent(
          token
        )}`;
        console.log("feedbackLink: ", feedbackLink);

        return res.json({
          ...rows[0][0],
          feedbackLink: feedbackLink,
        });
      }

      // Return regular response if no feedback needed
      res.json(rows[0][0]);
    });
  } catch (error) {
    console.error("Error in Task_Complete_Button_Click:", error);
    res.status(500).json({
      error: "An error occurred while processing the request",
      message: error.message,
    });
  }
});

router.get("/Get_feedback_reports", function (req, res, next) {
  try {
    const Customer_Name_ = req.query.Customer_Name || "";
    const Start_Date_ = req.query.Start_Date || "";
    const End_Date_ = req.query.End_Date || "";

    task.Get_feedback_reports(
      Customer_Name_,
      Start_Date_,
      End_Date_,
      function (err, rows) {
        if (err) {
          return res.json({
            success: false,
            message: "Failed to fetch feedback reports",
            error: err,
          });
        }

        res.json({
          success: true,
          message: "Feedback reports fetched successfully",
          data: rows[0],
        });
      }
    );
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});

router.get("/Task_History_Button_Click/", function (req, res, next) {
  try {
    task.Task_History_Button_Click(
      req.query.User_Details_Id,
      req.query.Is_Date,
      req.query.Fromdate,
      req.query.Todate,
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

router.post("/Save_task_note/", function (req, res, next) {
  try {
    task.Save_task_note(req.body, function (err, rows) {
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

router.post("/Save_task_document/", function (req, res, next) {
  try {
    task.Save_task_document(req.body, function (err, rows) {
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

router.get("/Get_task_note/", function (req, res, next) {
  try {
    task.Get_task_note(
      req.query.Task_Id,
      req.query.User_Details_Id,
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

router.get("/Get_task_document/", function (req, res, next) {
  try {
    task.Get_task_document(
      req.query.Task_Id,
      req.query.User_Details_Id,
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

router.delete("/Delete_task_note/:Task_Note_Id?", function (req, res, next) {
  try {
    task.Delete_task_note(req.params.Task_Note_Id, function (err, rows) {
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
  "/Delete_task_document/:Task_Document_Id?",
  function (req, res, next) {
    try {
      task.Delete_task_document(
        req.params.Task_Document_Id,
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

router.get("/Get_task_By_Customer/", function (req, res, next) {
  try {
    task.Get_task_By_Customer(
      req.query.Customer_Id,
      req.query.Task_Type_Id,
      req.query.Task_Status_Id,
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

router.get("/Get_task_By_Customer_With_Documents/", function (req, res, next) {
  try {
    task.Get_task_By_Customer_With_Documents(
      req.query.Customer_Id,
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

router.post("/Save_Version/", function (req, res, next) {
  try {
    task.Save_Version(req.body, function (err, rows) {
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

router.get("/Get_Version", function (req, res, next) {
  try {
    task.Get_Version(function (err, rows) {
      if (err) {
        res.status(500).json({
          error: "An error occurred while fetching the version.",
          details: err,
        });
      } else {
        if (rows && rows[0] && rows[0][0]) {
          res.json(rows[0][0]);
        } else {
          res.status(404).json({ error: "No version information found." });
        }
      }
    });
  } catch (e) {
    res
      .status(500)
      .json({ error: "Unexpected server error.", details: e.message });
  }
});

router.get("/get_task_expense_by_reference", function (req, res, next) {
  try {
    // Extract Task_Id_ and Type_Id_ from query parameters
    const Task_Id_ = req.query.Task_Id_;
    const Type_Id_ = req.query.Type_Id_;

    // Ensure both parameters are provided
    if (!Task_Id_ || !Type_Id_) {
      return res.status(400).json({
        success: false,
        message: "Task_Id_ and Type_Id_ are required",
      });
    }

    // Call the model function to fetch the data
    task.get_task_expense_by_reference(
      Task_Id_,
      Type_Id_,
      function (err, result) {
        if (err) {
          res.status(500).json({
            success: false,
            message: "Failed to fetch task expense records",
            error: err,
          });
        } else {
          res.json({
            success: true,
            message: "Task expense records fetched successfully",
            data: result,
          });
        }
      }
    );
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});

router.get("/get_task_expense", function (req, res, next) {
  try {
    // Extract user_id and task_id from query parameters
    const user_id = req.query.user_id;
    const task_id = req.query.task_id;

    // Ensure both parameters are provided
    if (!user_id || !task_id) {
      return res.status(400).json({
        success: false,
        message: "user_id and task_id are required",
      });
    }

    // Call the model function to fetch the data
    task.get_task_expense(user_id, task_id, function (err, result) {
      if (err) {
        res.status(500).json({
          success: false,
          message: "Failed to fetch task expense records",
          error: err,
        });
      } else {
        res.json({
          success: true,
          message: "Task expense records fetched successfully",
          data: result,
        });
      }
    });
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});

router.post("/save_expense_details", function (req, res, next) {
  try {
    const expenseDetails = {
      Task_Expense_Id: req.body.Task_Expense_Id,
      Expense_Type_Id: req.body.Expense_Type_Id,
      Task_Id: req.body.Task_Id,
      User_Id: req.body.User_Id,
      Expense_Reference_Id: req.body.Expense_Reference_Id || 0, // Default to 0 if not provided
      Description: req.body.Description,
      Date: req.body.Date,
      Time: req.body.Time,
    };

    task.Save_expense_details(expenseDetails, function (err, result) {
      if (err) {
        res.status(500).json({
          success: false,
          message: "Failed to save expense details",
          error: err,
        });
      } else {
        res.json({
          success: true,
          message: "Expense details saved successfully",
          data: result,
        });
      }
    });
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});
router.post("/Change_Task_Status", function (req, res, next) {
  try {
    let taskData = req.body;
    console.log(taskData);

    task.Change_Task_Status(taskData, function (err, rows) {
      if (err) {
        console.log("err: ", err);
        res.status(500).json({ success: false, error: err });
      } else {
        res.status(200).json({ success: true, data: rows[0] });
      }
    });
  } catch (e) {
    console.log("e: ", e);
    res.status(500).json({ success: false, error: e.message });
  }
});

router.post("/send_task_otp/", function (req, res, next) {
  try {
    const otp = Math.floor(1000 + Math.random() * 9000);
    console.log("otp: ", otp);

    const phoneNumber = req.body.phoneNumber;

    res.json({ otp, phoneNumber });
    // task.send_task_otp(req.body, function (err, rows) {
    //   if (err) {
    //     res.json(err);
    //   }
    //   else {
    //     res.json(rows[0][0]);
    //   }
    // });
  } catch (e) {
    res
      .status(500)
      .json({ error: "Internal Server Error", details: e.message });
  }
});
router.get("/Get_Task_Info_Dashboard", function (req, res, next) {
  try {

    task.Get_Task_Info_Dashboard(req.User_Details_Id,function (err, result) {
      if (err) {
        res.status(500).json({
          success: false,
          message: "Failed to fetch task info dashboard records",
          error: err,
        });
      } else {
        // console.log("json ",JSON.stringify(result[0][0].taskList));
        res.json({
          success: true,
          message: "Task info dashboard records fetched successfully",
          data: result[0],
        });
      }
    });
  } catch (e) {
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: e.message,
    });
  }
});

module.exports = router;
