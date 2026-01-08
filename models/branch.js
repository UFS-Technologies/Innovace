var db = require("../dbconnection");

var branch = {
  Save_Branch: (data) => {
    const {
      branch_id = 0,
      branch_name,
      address,
      phone,
      pincode,
      email,
      contact_person,
    } = data;

    return new Promise((resolve, reject) => {
      db.query(
        "CALL Save_Branch(?,?,?,?,?,?,?)",
        [
          branch_id,
          branch_name,
          address,
          phone,
          pincode,
          email,
          contact_person,
        ],
        (err, results) => {
          if (err) return reject(err);
          resolve(results);
        }
      );
    });
  },

  Get_All_Branch: () => {
    return new Promise((resolve, reject) => {
      db.query("CALL Get_All_Branch()", (err, results) => {
        if (err) return reject(err);
        resolve(results[0]);
      });
    });
  },

  Delete_Branch: (data) => {
    return new Promise((resolve, reject) => {
      db.query("CALL Delete_Branch(?)", [data], (err, results) => {
        if (err) return reject(err);
        resolve(results);
      });
    });
  },
};

module.exports = branch;
