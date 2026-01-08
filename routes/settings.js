 var express = require('express');
 var router = express.Router();
 var settings=require('../models/settings');
 router.post('/Save_settings/',function(req,res,next)
 { 
 try 
 {
settings.Save_settings(req.body, function (err, rows) 
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
 router.get('/Search_settings/',function(req,res,next)
 { 
 try 
 {
settings.Search_settings(req.query.settings_Name, function (err, rows) 
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
 router.get('/Get_settings/:settings_Id_?',function(req,res,next)
 { 
 try 
 {
settings.Get_settings(req.params.settings_Id_, function (err, rows) 
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
 router.get('/Delete_settings/:settings_Id_?',function(req,res,next)
 { 
 try 
 {
settings.Delete_settings(req.params.settings_Id_, function (err, rows) 
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

  router.post('/Save_document_type/', function (req, res, next) {
    try {
      settings.Save_document_type(req.body, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0][0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });

  router.delete('/Delete_document_type/:Document_Type_Id_?', function (req, res, next) {
    try {
      settings.Delete_document_type(req.params.Document_Type_Id_, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0][0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });

  router.get('/Search_document_type/', function (req, res, next) {
    try {
      settings.Search_document_type(req.query.Document_Type_Name, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });

  router.post('/Save_Company/', function (req, res, next) {
    try {
      settings.Save_Company(req.body, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0][0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });
// Save_custom_field
router.post('/Save_custom_field', function (req, res, next) {
    try {
      settings.Save_custom_field(req.body, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          console.log(rows);
          res.json(rows[0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });
  // Delete_custom_field
router.post('/Delete_custom_field', function (req, res, next) {
    try {
      settings.Delete_custom_field(req.body.Custom_Field_Id, function (err, rows) {
        if (err) {
          res.json(err);
        }
        else {
          res.json(rows[0]);
        }
      });
    }
    catch (e) {
    }
    finally {
    }
  });
  // Get_All_custom_field
  router.get('/Get_All_custom_field/', function (req, res, next) {
  try {
    settings.Get_All_custom_field( function (err, rows) {
      if (err) {
        console.log("Error in Get_All_custom_field:", err);
        
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});
router.get('/Get_Company_Details/', function (req, res, next) {
  try {
    settings.Get_Company_Details( function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});


// Get_custom_field
router.get('/Get_custom_field_type/', function (req, res, next) {
  try {
    settings.Get_custom_field_type( function (err, rows) {
      if (err) {
        res.json(err);
      }
      else {
        res.json(rows[0]);
      }
    });
  }
  catch (e) {
  }
  finally {
  }
});

  module.exports = router;

