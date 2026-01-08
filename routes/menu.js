 var express = require('express');
 var router = express.Router();
 var menu=require('../models/menu');
 router.post('/Save_menu/',function(req,res,next)
 { 
 try 
 {
menu.Save_menu(req.body, function (err, rows) 
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
 router.get('/Search_menu/',function(req,res,next)
 { 
 try 
 {
menu.Search_menu(req.query.menu_Name, function (err, rows) 
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
 router.get('/Get_menu/:menu_Id_?',function(req,res,next)
 { 
 try 
 {
menu.Get_menu(req.params.menu_Id_, function (err, rows) 
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
 router.get('/Delete_menu/:menu_Id_?',function(req,res,next)
 { 
 try 
 {
menu.Delete_menu(req.params.menu_Id_, function (err, rows) 
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

