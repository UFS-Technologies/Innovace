 var express = require('express');
 var router = express.Router();
 var amc=require('../models/amc');
 router.post('/Save_amc/',function(req,res,next)
 { 
 try 
 {
amc.Save_amc(req.body, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
     console.log(req.body);
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
 router.get('/Search_AMC_Report/',function(req,res,next)
 { 
 try 
 {
amc.Search_AMC_Report(req.query.Customer_Name, req.query.AMC_Status_Id,req.query.Is_Date, req.query.Fromdate, req.query.Todate, req.query.To_User_Id
  , function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows[0]);
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
 router.get('/Get_amc/:amc_Id_?',function(req,res,next)
 { 
 try 
 {
amc.Get_amc(req.params.amc_Id_, function (err, rows) 
 {
  if (err) 
  {
  res.json(err);
  }
  else 
  {
    res.json(rows);
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
 router.delete('/Delete_amc/:amc_Id_?',function(req,res,next)
 { 
 try 
 {
amc.Delete_amc(req.params.amc_Id_, function (err, rows) 
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

  router.get('/Get_Amc_By_Customer/', function (req, res, next) {
    try {
      amc.Get_Amc_By_Customer(req.query.Customer_Id, req.query.AMC_Status_Id, function (err, rows) {
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

  module.exports = router;

