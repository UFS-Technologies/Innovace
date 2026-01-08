var db = require("../dbconnection");
const storedProcedure = require('../helpers/stored-procedure');

var Login = {
  Login_Check: function(User_Name_, Password_, callback) {
    console.log(User_Name_, Password_)
    return db.query(
      "CALL Login_Check (@User_Name_ :=?,@Password_ :=?)",
      [User_Name_, Password_],
      callback
    );
  },
  forgetPassword: function(email_, callback) {
    console.log(email_,)
    return db.query(
      "CALL Forget_Password (@email_ :=?)",
      [email_],
      callback
    );
  },

  Agent_Login: function(Phone_,Country_Code_, OTP,Device_Id_, callback) {
    console.log(Phone_, Country_Code_, OTP,Device_Id_)
    return db.query(
      "CALL Agent_Login (@Phone_ :=?,@Country_Code_ :=?,@OTP :=?,@Device_Id_:=?)",
      [Phone_,Country_Code_, OTP,Device_Id_],
      callback
    );
  },


  Student_Login_Check: function(Email_, Password_, callback) {
    return db.query("CALL Student_Login_Check (@Email_ :=?,@Password_ :=?)",
      [Email_, Password_],
      callback
    );
  },
  Candidate_Login: function(Mobile_, Password_, callback) {
    return db.query("CALL Candidate_Login (@Mobile_ :=?,@Password_ :=?)",
      [Mobile_, Password_],
      callback
    );
  },

  Get_OTP: async function(Phone_, OTP) {
    
    const Data = await (new storedProcedure('Get_OTP', [Phone_, OTP])).result();
    console.log('Data: ', Data);
    
    
    return { Data };

},




Check_OTP: function(
    OTP,
    User_Details_Id_,
    callback
) {
    return db.query(
        "CALL Check_OTP(@OTP_ :=?,@User_Details_Id_ :=?)", [OTP, User_Details_Id_],
        callback
    );
},

Login_Check_With_Mobile: function(Mobile_, Password_, callback) {
  console.log(Mobile_, Password_)
  return db.query(
    "CALL Login_Check_With_Mobile (@Mobile_ :=?,@Password_ :=?)",
    [Mobile_, Password_],
    callback
  );
},
Login_Check_App: function(User_Name_, Password_, callback) {
  console.log(User_Name_, Password_)
  return db.query(
    "CALL Login_Check_App (@User_Name_ :=?,@Password_ :=?)",
    [User_Name_, Password_],
    callback
  );
},
  
};
module.exports = Login;
