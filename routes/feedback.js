var express = require('express');
var router = express.Router();
var feedback = require('../models/feedback');

router.post('/Save_feedback', function(req, res, next) {
    try {
        const jwt = require('jsonwebtoken');
        const JWT_SECRET = 'SolarisbackendOtpSent';
        const token = req.body.token;
        console.log('token: ', token);

        // Verify token first
        jwt.verify(token, JWT_SECRET, async (verifyErr, decoded) => {
            if (verifyErr) {
                return res.json({
                    success: false,
                    message: 'Invalid or expired token'
                });
            }

            // Check for existing feedback
            feedback.Check_existing_feedback(decoded.Task_Id, decoded.Customer_Id, function(checkErr, checkRows) {
                if (checkErr) {
                    return res.json({
                        success: false,
                        message: 'Error checking existing feedback',
                        error: checkErr
                    });
                }

                if (checkRows && checkRows.length > 0) {
                    return res.json({
                        success: false,
                        message: 'Feedback already exists for this task and customer'
                    });
                }

                // Proceed with saving feedback
                feedback.Save_feedback(req.body, function(err, rows) {
                    if (err) {
                        return res.json({
                            success: false,
                            message: 'Error saving feedback',
                            error: err
                        });
                    }

                    res.json({
                        success: true,
                        message: 'Feedback saved successfully',
                        data: rows[0][0]
                    });
                });
            });
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});
router.get('/Get_feedback/:Feedback_Id?', function(req, res, next) {
    try {
        feedback.Get_feedback(req.params.Feedback_Id, function(err, rows) {
            if (err) {
                res.json(err);
            } else {
                res.json(rows[0][0]);
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});

router.get('/Get_feedback_by_task/:Task_Id?', function(req, res, next) {
    try {
        feedback.Get_feedback_by_task(req.params.Task_Id, function(err, rows) {
            if (err) {
                res.json(err);
            } else {
                res.json(rows[0]);
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});

router.delete('/Delete_feedback/:Feedback_Id?', function(req, res, next) {
    try {
        feedback.Delete_feedback(req.params.Feedback_Id, function(err, rows) {
            if (err) {
                res.json(err);
            } else {
                res.json(rows[0][0]);
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});

module.exports = router;