 var express = require('express');
 var router = express.Router();
 var user_type=require('../models/user_type');
 router.post('/Save_user_type/',function(req,res,next)
 { 
 try 
 {
user_type.Save_user_type(req.body, function (err, rows) 
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
 router.get('/Search_user_type/',function(req,res,next)
 { 
 try 
 {
user_type.Search_user_type(req.query.user_type_Name, function (err, rows) 
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
 router.get('/Get_user_type/:user_type_Id_?',function(req,res,next)
 { 
 try 
 {
user_type.Get_user_type(req.params.user_type_Id_, function (err, rows) 
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
 router.get('/Delete_user_type/:user_type_Id_?',function(req,res,next)
 { 
 try 
 {
user_type.Delete_user_type(req.params.user_type_Id_, function (err, rows) 
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

