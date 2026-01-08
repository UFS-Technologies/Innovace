const CustomResponse = require("../../helpers/custom-response");
const storedProcedure = require("../../helpers/stored-procedure");

const Agent_login =async (req, res) => {
  const cResponse = new CustomResponse(req, res);
  if (!req.body.username) {
    return cResponse.sendError({ message: "no_username" });
  }
  if (!req.body.password) {
    return cResponse.sendError({ message: "no_password" });
  }
  try {
    const stored = await new storedProcedure("Login_Check_Agent", [
      req.body.username,
      req.body.password
    ]).result();
    return cResponse.sendSuccess({ message: "login_success" ,access_token:'token'});
  } catch (e) {
    cResponse.sendError({ message: "unable_to_login", track: e });
  }
};


const login =async (req, res) => {
  const cResponse = new CustomResponse(req, res);
  if (!req.body.username) {
    return cResponse.sendError({ message: "no_username" });
  }
  if (!req.body.password) {
    return cResponse.sendError({ message: "no_password" });
  }
  try {
    const stored = await new storedProcedure("Login_Check", [
      req.body.username,
      req.body.password
    ]).result();

    return cResponse.sendSuccess({ message: "login_success" ,access_token:'token'});
  } catch (e) {
    //
    cResponse.sendError({ message: "unable_to_login", track: e });
  }
  // cResponse.sendSuccess({ message: 'login_success' });
};

const ForgetPassword = async (req, res) => {
  const cResponse = new CustomResponse(req, res);
  if (!req.body.username) {
    return cResponse.sendError({ message: "no_username" });
  }
  if (!req.body.password) {
    return cResponse.sendError({ message: "no_password" });
  }
  try {
    const stored = await new storedProcedure("Login_Check", [
      req.body.username,
      req.body.password
    ]).result();
    // const stored2 = await new storedProcedure("Login_Check2", [
    //   stored.username,
    //   req.body.password
    // ]).result();

    return cResponse.sendSuccess({ message: "login_success", access_token: 'token' });
  } catch (e) {
    //
    cResponse.sendError({ message: "unable_to_login", track: e });
  }
  // cResponse.sendSuccess({ message: 'login_success' });
};
module.exports={
  login:login,ForgetPassword:ForgetPassword,Agent_login:Agent_login
}
