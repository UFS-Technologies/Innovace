 var express = require('express');
 var router = express.Router();
 var amc_status=require('../models/amc_status');
 router.post('/Save_amc_status/',function(req,res,next)
 
 { 
 try 
 {
amc_status.Save_amc_status(req.body, function (err, rows) 

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
 router.get('/Search_amc_status/',function(req,res,next)
 { 
 try 
 {
amc_status.Search_amc_status(req.query.amc_status_Name, function (err, rows) 
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
 router.get('/Get_amc_status/:amc_status_Id_?',function(req,res,next)
 { 
 try 
 {
amc_status.Get_amc_status(req.params.amc_status_Id_, function (err, rows) 
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
 router.get('/Delete_amc_status/:amc_status_Id_?',function(req,res,next)
 { 
 try 
 {
amc_status.Delete_amc_status(req.params.amc_status_Id_, function (err, rows) 
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
  module.exports = router;

