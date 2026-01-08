 var express = require('express');
 var router = express.Router();
 var user_menu_selection=require('../models/user_menu_selection');
 router.post('/Save_user_menu_selection/',function(req,res,next)
 { 
 try 
 {
user_menu_selection.Save_user_menu_selection(req.body, function (err, rows) 
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
 router.get('/Search_user_menu_selection/',function(req,res,next)
 { 
 try 
 {
user_menu_selection.Search_user_menu_selection(req.query.user_menu_selection_Name, function (err, rows) 
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
 router.get('/Get_user_menu_selection/:user_menu_selection_Id_?',function(req,res,next)
 { 
 try 
 {
user_menu_selection.Get_user_menu_selection(req.params.user_menu_selection_Id_, function (err, rows) 
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
 router.get('/Delete_user_menu_selection/:user_menu_selection_Id_?',function(req,res,next)
 { 
 try 
 {
user_menu_selection.Delete_user_menu_selection(req.params.user_menu_selection_Id_, function (err, rows) 
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

