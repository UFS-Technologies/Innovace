 var express = require('express');
 var router = express.Router();
 var service=require('../models/service');
 router.post('/Save_service/',function(req,res,next)
 { 
 try 
 {
service.Save_service(req.body, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows[0][0]);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });
router.get('/Search_Service_Report/', function (req, res, next) {
  try {
    service.Search_Service_Report(req.query.service_Name,req.query.Customer_Name,  req.query.Service_Status_Id,req.query.Is_Date, req.query.Fromdate, req.query.Todate
      ,req.query.To_User_Id, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});
 router.get('/Get_service/:service_Id_?',function(req,res,next)
 { 
 try 
 {
service.Get_service(req.params.service_Id_, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows[0][0]);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });
 router.delete('/Delete_service/:service_Id_?',function(req,res,next)
 { 
 try 
 {
service.Delete_service(req.params.service_Id_, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows[0][0]);
  }
  });
  }
 catch (e) 
 {
 }
 finally 
 {
 }
  });

  router.get('/Get_Service_By_Customer/', function (req, res, next) {
    try {
      service.Get_Service_By_Customer(req.query.Customer_Id, req.query.Service_Type_Id, req.query.Service_Status_Id, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });

router.post('/Save_Receipt/', function (req, res, next) {
  try {
    service.Save_Receipt(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0][0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.get('/Get_Receipt_By_Customer/', function (req, res, next) {
  try {
    service.Get_Receipt_By_Customer(req.query.Customer_Id, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.delete('/Delete_Receipt/:Receipt_Id_?', function (req, res, next) {
  try {
    service.Delete_Receipt(req.params.Receipt_Id_, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0][0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.get('/Receipt_Report/', function (req, res, next) {
  try {
    service.Receipt_Report(req.query.Fromdate, req.query.Todate, req.query.Is_Date_Check,req.query.Customer_Name,
      function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
        
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

router.post('/Save_Customer_Invoice/', function (req, res, next) {
  try {
    service.Save_Customer_Invoice(req.body, function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {    
        res.json(rows[0][0]);
        // console.log(rows[0][0]);
        
      }
    });
  }
  catch (e) {
    console.log(e);
    
  }
  finally {
  }
});

router.get('/Get_Customer_Invoice/', function (req, res, next) {
  try {
    service.Get_Customer_Invoice(req.query.Customer_Id,
      function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
        
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});


router.get('/Get_Customer_Invoice/', function (req, res, next) {
  try {
    service.Get_Customer_Invoice(req.query.Customer_Id,
      function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
        
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});


// router.get('/Billing_Payment_Report/', function (req, res, next) {
//   try {
//     service.Billing_Payment_Report(req.query.Customer_Name,req.query.Is_Date,req.query.Fromdate,req.query.Todate,
//       function (err, rows) {
//       if (err) {
//         res.json(err);
//       }
//       else {
//         res.json(rows[0]);
//         console.log("billing row",rows[0]);
               
//       }
//     });
//   }
//   catch (e) {
//     console.log("billing payment report error", e);
    
//   }
//   finally {
//   }
// });


  module.exports = router;

