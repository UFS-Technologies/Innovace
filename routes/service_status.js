 var express = require('express');
 var router = express.Router();
 var service_status=require('../models/service_status');
 router.post('/Save_service_status/',function(req,res,next)
 { 
 try 
 {
service_status.Save_service_status(req.body, function (err, rows) 
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
 router.get('/Search_service_status/',function(req,res,next)
 { 
 try 
 {
service_status.Search_service_status(req.query.service_status_Name, function (err, rows) 
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
 router.get('/Get_service_status/:service_status_Id_?',function(req,res,next)
 { 
 try 
 {
service_status.Get_service_status(req.params.service_status_Id_, function (err, rows) 
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
 router.get('/Delete_service_status/:service_status_Id_?',function(req,res,next)
 { 
 try 
 {
service_status.Delete_service_status(req.params.service_status_Id_, function (err, rows) 
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

