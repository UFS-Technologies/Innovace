var express = require("express");
var router = express.Router();
var Login = require("../models/Login");
const jwt = require('jsonwebtoken');
var fs = require('fs');
const config=require('../config.json');
const nodemailer = require("nodemailer");
const sgMail = require('@sendgrid/mail')
sgMail.setApiKey(process.env.SENDGRID_API_KEY);
const fetch = require("node-fetch");
const smsApiUrl = 'http://95.217.46.243:5664/api/SendSMS';

// var base64str = base64_encode("companylogo.PNG");
function base64_encode(file) {
 
  var bitmap = fs.readFileSync(file);
  return new Buffer.from(bitmap).toString("base64");
 } 
router.post("/Login_Check", function(req, res, next) {
  try {
    console.log(' req.query: ',  req.body);
    Login.Login_Check(req.body.userName, req.body.password, function(
      err,
      rows

    ) 
    {
     
      if (err) {

        // 
        console.log(err) 
        res.json(err);
      } else {
        console.log('rows[0][0]: ', rows[0][0]);
        if(rows[0][0]){
          const token = jwt.sign({ sub: rows[0][0] }, config.secret);
          res.json({ ...rows[0][0], token });
        }else{
          res.json({
            "result":"User not found"
          })
        }


      }
    });
  } catch (e) {
    // 
  } finally {
  }
});
router.get("/forgetPassword/:email?", function(req, res, next) {
  try {
    Login.forgetPassword(req.params.email, async function(
      err,
      rows

    ) 
    {
     
      if (err) {

        // 
        console.log(err)
        res.json(err);
      } else {

        console.log(rows[0][0])

if(rows[0][0]['Password']!=null){
  // let transporter = nodemailer.createTransport({
  //   host: 'smtp.gmail.com',
  //   port: 587,
  //   secure: false,
  //   requireTLS: true,
  //   auth: 
  //   {
  //     user: 'teena@ufstechnologies.com',
  //     pass: 'teena1225'
  //   }
  // });
  // console.log(rows[0][0]['Email']);




  // const msg = 
  // {
  //   to: rows[0][0]['Email'],
  //   from: 'notifications@darlsco.com',
  //   subject: 'Password Recovery -',
  


  //   html: `
  //   <div style="font-family: 'Arial', sans-serif; color: #333; max-width: 600px; margin: 20px auto;">
    
  //     <h2 style="text-align: center; color: #333;">Password Recovery</h2>
  //     <p>Hello,</p>
  //     <p>We received a request to recover your password. Here are your password recovery details:</p>
  //     <p><strong>Password:</strong> ${rows[0][0]['Password']}</p>
  //     <p>If you did not initiate this request, please ignore this email or contact support.</p>
  //     <p>Thank you for choosing DARLSCO.</p>
  //     <p>Best regards,<br>DARLSCO</p>
  //   </div>
  // `,


    
  // }
  // sgMail
  // sgMail
  // .send(msg)
  // .then(() => {
  //   console.log('Email sent successfully');
  //   // Send success response to the frontend
  //   res.status(200).json({ message: 'Email sent successfully' });
  // })
  // .catch((error) => {
  //   console.error(error.toString());
  //   // Send error response to the frontend
  //   res.status(500).json({ message: 'Failed to send email' });
  // });
}else{
  res.status(500).json({ message: `Sorry, we couldn't find an account with the entered Email ID` });

}


      // 
     


      }
    });
  } catch (e) {
    // 
  } finally {
  }
});




router.get("/Agent_Login/:Phone_?/:Country_Code_?/:OTP?/:Device_Id_?", function(req, res, next) {
  try {
     console.log(req.query);
    // req.params.Phone_,req.params.OTP
    // req.query.phone, req.query.OTP
    Login.Agent_Login(req.query.phone,req.query.Country_Code,req.query.otp,req.query.Device_Id, function(
      err,
      rows

    ) 
    {
     
      if (err) {
       
        res.json(err);
        
      } else {
        // console.log( 'one');
         console.log(rows);
        // console.log( 'Two');

        if(rows[0][0].Id>0)
        {
          const token = jwt.sign({ sub: rows[0][0] }, config.secret);
          res.json({...rows,token});
        }
        else
        {
          res.json({...rows});
        }

      // 
        // res.json({...rows,token});

// console.log({...rows,token});
      }
    });
  } catch (e) {
  } finally {
  }
});


router.get("/Student_Login_Check/:Email?/:Password?", function(req, res, next) {
  try {
    Login.Student_Login_Check(req.params.Email, req.params.Password, function(err,rows) 
    {
      if (err) {
        res.json(err);
      }
       else {
        const token = jwt.sign({ sub: rows[0][0] }, config.secret);
        res.json({...rows,token}); }
    });
  } 
  catch (e) {
  } 
  finally {
  }
});

router.get("/Get_OTP/:Phone_?",async (req, res, next) =>
  {
        try
        {
          console.log(req.query);
          var OTP = Math.floor(1000 + Math.random() * 9000);
        const result = await Login.Get_OTP(req.query.phone,OTP);
      
        
      const smsParams = {
          api_id: 'API7976738720',
          api_password: 'D@rlsc0@123',
          sms_type: 'T',
          encoding: 'T',
          phonenumber: req.query.Country_Code+req.query.phone,
          textmessage: `${OTP} is the OTP to verify your mobile number on the SOLARIS App.\n\nTeam SOLARIS`,       
          sender_id: 'DARLSCO'
        };
        console.log('smsParams: ', smsParams);
  
        console.log('result.Data.length: ', result.Data.length);
        if(result.Data.length>0)
        {
      
        try {
            const temp = await fetch(smsApiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(smsParams),
            });
        
            // Extracting JSON content from the response
            const responseJson = await temp.json();
            
            console.log(responseJson); // View the response in the browser console
        } catch (error) {
            console.error('Error occurred while fetching:', error);
        }
  
      }
  
        // sms_commented 
  
         console.log('result', result);
        res.send(result);
        } 
        catch (e) 
        {
         console.log(e)
        res.send(e);
        } 
        finally 
        {
        }
        });
  
  
  
  
  
        router.get("/Check_OTP/", function (req, res, next) {
          try {
            Login.Check_OTP(
              req.query.OTP,
              req.query.User_Details_Id_,
              function (err, rows) {
                if (err) {
                  console.log(err);
        
                  res.json(err);
                } else {
                  console.log(rows);
                  const token = jwt.sign({ sub: rows[0][0] }, config.secret);
                  res.json({...rows[0][0],token});
                }
              }
            );
          } catch (e) {
            console.log(e);
          } finally {
          }
        });


        router.post("/Login_Check_With_Mobile", function(req, res, next) {
          try {
            console.log(' req.query: ',  req.body);
            Login.Login_Check_With_Mobile(req.body.Mobile, req.body.password, function(
              err,
              rows
        
            ) 
            {
             
              if (err) {
        
                // 
                console.log(err) 
                res.json(err);
              } else {

                console.log('rows[0][0]: ', rows[0][0]);
                if(rows[0][0]){
                  const token = jwt.sign({ sub: rows[0][0] }, config.secret);
                  res.json({...rows[0][0],token});
            
                }else{
                  res.json({
                    "result":"User not found"
                  })
                }
                
              }
            });
          } catch (e) {
            // 
          } finally {
          }
        });


router.post("/Login_Check_App", function (req, res, next) {
  try {
    console.log(' req.query: ', req.body);
    Login.Login_Check_App(req.body.userName, req.body.password, function (
      err,rows ) {
      if (err) {
        console.log(err)
        res.json(err);
      } else {
        console.log('rows[0][0]: ', rows[0][0]);
        if(rows[0][0]){
          const token = jwt.sign({ sub: rows[0][0] }, config.secret);
          res.json({ ...rows[0][0], token });
        }else{
          res.json({
            "result":"User not found"
          })
        }
        
      }
    });
  } catch (e) {
   
  } finally {
  }
});

module.exports = router;
