 var express = require('express');
 var router = express.Router();
 var user_role=require('../models/user_role');
 router.post('/Save_user_role/',function(req,res,next)
 { 
 try 
 {
user_role.Save_user_role(req.body, function (err, rows) 
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
 router.get('/Search_user_role/',function(req,res,next)
 { 
 try 
 {
user_role.Search_user_role(req.query.user_role_Name, function (err, rows) 
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
 router.get('/Get_user_role/:user_role_Id_?',function(req,res,next)
 { 
 try 
 {
user_role.Get_user_role(req.params.user_role_Id_, function (err, rows) 
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
 router.get('/Delete_user_role/:user_role_Id_?',function(req,res,next)
 { 
 try 
 {
user_role.Delete_user_role(req.params.user_role_Id_, function (err, rows) 
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

