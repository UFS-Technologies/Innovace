 var express = require('express');
 var router = express.Router();
 var bill_of_materials=require('../models/bill_of_materials');
 router.post('/Save_bill_of_materials/',function(req,res,next)
 { 
 try 
 {
bill_of_materials.Save_bill_of_materials(req.body, function (err, rows) 
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
 router.get('/Search_bill_of_materials/',function(req,res,next)
 { 
 try 
 {
bill_of_materials.Search_bill_of_materials(req.query.bill_of_materials_Name, function (err, rows) 
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
 router.get('/Get_bill_of_materials/:bill_of_materials_Id_?',function(req,res,next)
 { 
 try 
 {
bill_of_materials.Get_bill_of_materials(req.params.bill_of_materials_Id_, function (err, rows) 
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
 router.get('/Delete_bill_of_materials/:bill_of_materials_Id_?',function(req,res,next)
 { 
 try 
 {
bill_of_materials.Delete_bill_of_materials(req.params.bill_of_materials_Id_, function (err, rows) 
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

