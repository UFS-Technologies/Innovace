 var express = require('express');
 var router = express.Router();
 var remarks=require('../models/remarks');
 router.post('/Save_remarks/',function(req,res,next)
 { 
 try 
 {
remarks.Save_remarks(req.body, function (err, rows) 
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
 router.get('/Search_remarks/',function(req,res,next)
 { 
 try 
 {
remarks.Search_remarks(req.query.remarks_Name, function (err, rows) 
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
 router.get('/Get_remarks/:remarks_Id_?',function(req,res,next)
 { 
 try 
 {
remarks.Get_remarks(req.params.remarks_Id_, function (err, rows) 
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
 router.get('/Delete_remarks/:remarks_Id_?',function(req,res,next)
 { 
 try 
 {
remarks.Delete_remarks(req.params.remarks_Id_, function (err, rows) 
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

