 var express = require('express');
 var router = express.Router();
 var working_status=require('../models/working_status');
 router.post('/Save_working_status/',function(req,res,next)
 { 
 try 
 {
working_status.Save_working_status(req.body, function (err, rows) 
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
 router.get('/Search_working_status/',function(req,res,next)
 { 
 try 
 {
working_status.Search_working_status(req.query.working_status_Name, function (err, rows) 
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
 router.get('/Get_working_status/:working_status_Id_?',function(req,res,next)
 { 
 try 
 {
working_status.Get_working_status(req.params.working_status_Id_, function (err, rows) 
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
 router.get('/Delete_working_status/:working_status_Id_?',function(req,res,next)
 { 
 try 
 {
working_status.Delete_working_status(req.params.working_status_Id_, function (err, rows) 
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

