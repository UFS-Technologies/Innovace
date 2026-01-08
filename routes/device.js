 var express = require('express');
 var router = express.Router();
 var device=require('../models/device');
 router.post('/Save_device/',function(req,res,next)
 { 
 try 
 {
device.Save_device(req.body, function (err, rows) 
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
 router.get('/Search_device/',function(req,res,next)
 { 
 try 
 {
device.Search_device(req.query.device_Name, function (err, rows) 
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
 router.get('/Get_device/:device_Id_?',function(req,res,next)
 { 
 try 
 {
device.Get_device(req.params.device_Id_, function (err, rows) 
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
 router.get('/Delete_device/:device_Id_?',function(req,res,next)
 { 
 try 
 {
device.Delete_device(req.params.device_Id_, function (err, rows) 
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

