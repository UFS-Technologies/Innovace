 var express = require('express');
 var router = express.Router();
 var chat=require('../models/chat');
 router.post('/Save_chat/',function(req,res,next)
 { 
 try 
 {
chat.Save_chat(req.body, function (err, rows) 
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
 router.get('/Search_chat/',function(req,res,next)
 { 
 try 
 {
chat.Search_chat(req.query.chat_Name, function (err, rows) 
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
 router.get('/Get_chat/:chat_Id_?',function(req,res,next)
 { 
 try 
 {
chat.Get_chat(req.params.chat_Id_, function (err, rows) 
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
 router.get('/Delete_chat/:chat_Id_?',function(req,res,next)
 { 
 try 
 {
chat.Delete_chat(req.params.chat_Id_, function (err, rows) 
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

