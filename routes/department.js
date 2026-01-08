var express = require('express');
var router = express.Router();
var departmentModel = require('../models/department');

router.get('/Search_department', function (req, res, next) {
    try {
        departmentModel.Search_department(req.query.department_name, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to search department',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Department search successful',
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

router.post('/Save_department', function (req, res, next) {
    try {
        const { department_id, department_name } = req.body;
        
        departmentModel.Save_department(department_id, department_name, function (err, result) {
            if (err) {
                console.log('err: ', err);
                res.status(500).json({
                    success: false,
                    message: 'Failed to save department',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Department saved successfully',
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

router.post('/Delete_department', function (req, res, next) {
    try {
        const { department_id } = req.body;
        
        departmentModel.Delete_department(department_id, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to delete department',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Department deleted successfully',
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