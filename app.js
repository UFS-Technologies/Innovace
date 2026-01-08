const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);

const socketManager = require('./socket');
socketManager.initialize(server); // ✅ Must come AFTER server creation

const path = require("path");
const favicon = require("serve-favicon");
const multer = require("multer");
const multerupload = multer({ dest: "fileprint/" });
const logger = require("morgan");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./dbconnection");
const sgMail = require("@sendgrid/mail");
const storedProcedure = require("./helpers/stored-procedure");
const jwt = require("./helpers/jwt");
const errorHandler = require("./helpers/error-handler");

// Routes
const routes = require("./routes/index");
const Login = require("./routes/Login");
const feedback = require("./routes/feedback");
const amc = require("./routes/amc");
const amc_status = require("./routes/amc_status");
const bill_of_materials = require("./routes/bill_of_materials");
const chat = require("./routes/chat");
const device = require("./routes/device");
const followup = require("./routes/followup");
const lead = require("./routes/lead");
const menu = require("./routes/menu");
const quotation_details = require("./routes/quotation_details");
const quotation_master = require("./routes/quotation_master");
const quotation_status = require("./routes/quotation_status");
const remarks = require("./routes/remarks");
const service = require("./routes/service");
const service_status = require("./routes/service_status");
const settings = require("./routes/settings");
const status = require("./routes/status");
const task = require("./routes/task");
const task_status = require("./routes/task_status");
const user_details = require("./routes/user_details");
const user_menu_selection = require("./routes/user_menu_selection");
const user_role = require("./routes/user_role");
const user_type = require("./routes/user_type");
const working_status = require("./routes/working_status");
const attendance = require("./routes/attendance");
const itemRoutes = require("./routes/item");
const departmentRouter = require("./routes/department.js");
const process_flow = require("./routes/process_flow.js");
const dashboard = require("./routes/dashboard.js");
const category = require("./routes/category.js");
const branch = require("./routes/branch.js");
const whatsapp = require("./routes/whatsapp.js");
const port = process.env.PORT || 3511;

// Middleware
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");
app.use(cors());
app.use(logger("dev"));
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// Routing
app.use("/", routes);
app.use("/Login", Login);
app.use("/Feedback", feedback);

app.post("/Post_GoogleSheet_Lead/", async function (req, res) {
  try {
    
    const pool = db.promise();
    const connection = await pool.getConnection();
    const Lead_ = req.body.data;

    if (!Lead_['Name'] || Lead_['Name'] === 'Name') {
      console.log("Invalid lead data");
      return res.send({ success: "false" });
    }

    const result = await (new storedProcedure("Post_GoogleSheet_Lead", [
      Lead_["Name"],
      Lead_["Phone"],
      Lead_["Enquiry_Source"]
    ], connection)).result();

    connection.release();
    res.send(result);
  } catch (err) {
    console.error("Error:", err);
    res.send(err);
  }
});
app.use("/whatsapp",whatsapp);
app.use(jwt());

app.use("/amc", amc);
app.use("/amc_status", amc_status);
app.use("/bill_of_materials", bill_of_materials);
app.use("/chat", chat);
app.use("/device", device);
app.use("/followup", followup);
app.use("/lead", lead);
app.use("/menu", menu);
app.use("/quotation_details", quotation_details);
app.use("/quotation_master", quotation_master);
app.use("/quotation_status", quotation_status);
app.use("/remarks", remarks);
app.use("/service", service);
app.use("/service_status", service_status);
app.use("/settings", settings);
app.use("/status", status);
app.use("/task", task);
app.use("/task_status", task_status);
app.use("/user_details", user_details);
app.use("/user_menu_selection", user_menu_selection);
app.use("/user_role", user_role);
app.use("/user_type", user_type);
app.use("/working_status", working_status);
app.use("/attendance", attendance);
app.use("/item", itemRoutes);
app.use("/department", departmentRouter);
app.use("/process_flow", process_flow);
app.use("/dashboard", dashboard);
app.use("/category", category);
app.use("/branch",branch);

// Hello route
app.get("/Edabraod/", (req, res) => {
  res.send("Hello World!");
});

// 404 middleware
app.use(function (req, res, next) {
  const err = new Error("Not Found");
  err.status = 404;
  next(err);
});

// CORS headers after all routes
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

// Start server
server.listen(port, () => {
  console.log(`Server started on ${port}`);
});

module.exports = app;
