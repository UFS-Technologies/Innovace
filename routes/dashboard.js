const express = require("express");
const router = express.Router();
const dashboardModel = require('../models/dashboard');

router.get('/Fetch_dashboard', function (req, res, next) {
    try {
        
        dashboardModel.Fetch_dashboard(req.User_Details_Id, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch dashboard',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Dashboard fetch successful',
                    data: result,
                });
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message,
        });
    }
});


module.exports = router;