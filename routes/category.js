const express = require('express');
const router = express.Router();
const category = require('../models/category');

// Get Check Listing Category And Items
router.get('/Get_Document_Check_List_Details/', function(req, res, next) {
    const masterId = parseInt(req.query.Document_Check_List_Master_Id) || 0;

    try {
        category.Get_Document_Check_List_Details(masterId, function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                const rawData = rows[0];
                const categoryMap = new Map();

                rawData.forEach(row => {
                    const categoryId = row.Check_List_Category_Id;

                    if (!categoryMap.has(categoryId)) {
                        categoryMap.set(categoryId, {
                            Check_List_Category_Id: categoryId,
                            Check_List_Category_Name: row.Check_List_Category_Name,
                            items: []
                        });
                    }

                    if (row.Check_List_Item_Id) {
                        categoryMap.get(categoryId).items.push({
                            Check_List_Item_Id: row.Check_List_Item_Id,
                            Check_List_Item_Name: row.Check_List_Item_Name,
                            Is_Check_List: row.Is_Check_List === 1,
                            Is_Check_List_Complete: row.Is_Check_List_Complete === 1
                        });
                    }
                });

                res.status(200).json({ success: true, data: Array.from(categoryMap.values()) });
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});


// Get Check Listing Category
router.get('/Get_Check_Lst_Category/', function(req, res, next) { 
    try {
        category.Get_Check_Lst_Category(function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                res.status(200).json({ success: true, data: rows[0] }); // rows[0] contains the actual result set
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Get Check Listing Items
router.get('/Get_Check_List_Item_Category/', function(req, res, next) { 
    try {
        const documentCheckListMasterId = parseInt(req.query.Document_Check_List_Master_Id || 0); // Default to 0 if not provided

        category.Get_Check_List_Item_Category(documentCheckListMasterId, function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                res.status(200).json({ success: true, data: rows[0] });
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});


// CRUD_Check_List_Category
router.post('/Save_Check_List_Category/', function(req, res, next) { 
    try {
        const { Check_List_Category_Id, Check_List_Category_Name } = req.body;

        category.Save_Check_List_Category(
            Check_List_Category_Id,
            Check_List_Category_Name,
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {

                    const action = Check_List_Category_Id == 0 ? "Inserted" : "Updated";
                    res.status(200).json({ 
                        success: true, 
                        message: `${action} successfully`, 
                        data: rows[0] 
                    });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Delete Check List Category
router.post('/Delete_Check_List_Category/', function(req, res, next) {
    try {
        const { Check_List_Category_Id } = req.body;

        if (!Check_List_Category_Id || Check_List_Category_Id <= 0) {
            return res.status(400).json({ success: false, message: "Invalid category ID" });
        }

        category.Delete_Check_List_Category(Check_List_Category_Id, function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                res.status(200).json({
                    success: true,
                    message: "Deleted successfully",
                    data: rows[0]
                });
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// CRUD_Check_List_Category_Item
router.post('/Save_Check_List_Item/', function(req, res, next) {
    const { Check_List_Item_Id, Check_List_Category_Id, Check_List_Item_Name } = req.body;

    try {
        category.Save_Check_List_Item(
            Check_List_Item_Id,
            Check_List_Item_Name,
            Check_List_Category_Id,
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    const result = rows[0] && rows[0][0];

                    // Check if the result contains the message indicating duplication
                    if (result && result.message === "Item already exists for the given category") {
                        res.status(200).json({
                            success: false,
                            message: result.message
                        });
                    } else {
                        const action = Check_List_Item_Id == 0 ? "Inserted" : "Updated";
                        res.status(200).json({
                            success: true,
                            message: `${action} successfully`,
                            data: result
                        });
                    }
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Delete Check List Category Item
router.post('/Delete_Check_List_Item/', function(req, res, next) {
    const { Check_List_Item_Id } = req.body;

    try {
        if (!Check_List_Item_Id || Check_List_Item_Id <= 0) {
            return res.status(400).json({
                success: false,
                message: "Invalid item ID"
            });
        }

        category.Delete_Check_List_Item(Check_List_Item_Id, function(err, rows) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: "Database error",
                    error: err
                });
            } else {
                res.status(200).json({
                    success: true,
                    message: "Deleted successfully",
                    data: rows[0]
                });
            }
        });
    } catch (e) {
        res.status(500).json({
            success: false,
            message: "Internal server error",
            error: e.message
        });
    }
});

// Search Check List Category
router.post('/Search_Check_List_Category/', function(req, res, next) {
    const { Check_List_Category_Name } = req.body;

    try {
        category.Search_Check_List_Category(Check_List_Category_Name || null, function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                res.status(200).json({
                    success: true,
                    data: rows[0] // First result set
                });
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Search Check List Item
router.post('/Search_Check_List_Item/', function(req, res, next) {
    const { Check_List_Item_Name, Check_List_Category_Id } = req.body;

    try {
        category.Search_Check_List_Item(
            Check_List_Item_Name || null,
            Check_List_Category_Id || null,
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    res.status(200).json({
                        success: true,
                        data: rows[0]
                    });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Save Document Check List
router.post('/Save_Document_Check_List/', function(req, res, next) {
    const { 
        Document_Check_List_Id, 
        Is_Check_List, 
        Check_List_Item_Id, 
        Check_List_Item_Name, 
        Check_List_Category_Id, 
        Check_List_Category_Name, 
        Is_Check_List_Complete 
    } = req.body;

    try {
        category.Save_Document_Check_List(
            Document_Check_List_Id, 
            Is_Check_List, 
            Check_List_Item_Id, 
            Check_List_Item_Name, 
            Check_List_Category_Id, 
            Check_List_Category_Name, 
            Is_Check_List_Complete, 
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    const action = Document_Check_List_Id == 0 ? "Inserted" : "Updated";
                    res.status(200).json({
                        success: true,
                        message: `${action} successfully`,
                        data: rows[0]
                    });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Save Document Check List Master
router.post('/Save_Document_Check_List_Master/', function(req, res, next) {
    const { 
        Document_Check_List_Master_Id, 
        Entry_Date, 
        User_Id, 
        Usr_Name, 
        Document_Check_List 
    } = req.body;

    try {
        category.Save_Document_Check_List_Master(
            Document_Check_List_Master_Id, 
            Entry_Date, 
            User_Id, 
            Usr_Name, 
            Document_Check_List, 
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    const action = Document_Check_List_Master_Id == 0 ? "Inserted" : "Updated";
                    res.status(200).json({
                        success: true,
                        message: `${action} successfully`,
                        data: rows[0]
                    });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Get Document Check List
router.get('/Get_Document_Check_List', function (req, res, next) {
    const {
        Document_Check_List_Master_Id = 0,
        Entry_Date = '',
        User_Id = 0,
        Usr_Name = ''
    } = req.body;

    try {
        category.Get_Document_Check_List(
            Document_Check_List_Master_Id,
            Entry_Date,
            User_Id,
            Usr_Name,
            function (err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: 'Database error', error: err });
                } else {
                    res.status(200).json({ success: true, message: 'Fetched successfully', data: rows[0] });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: 'Internal server error', error: e.message });
    }
});


// Search Document Check List
router.post('/Search_Document_Check_List/', function(req, res, next) {
    const { Document_Check_List_Master_Id, Entry_Date, User_Id, Usr_Name } = req.body;

    try {
        category.Search_Document_Check_List(
            Document_Check_List_Master_Id || 0,
            Entry_Date || '',
            User_Id || 0,
            Usr_Name || '',
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    res.status(200).json({ success: true, data: rows[0] });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Delete Document Check List
router.post('/Delete_Document_Check_List/', function(req, res, next) {
    const { Document_Check_List_Master_Id } = req.body;

    if (!Document_Check_List_Master_Id) {
        return res.status(400).json({ success: false, message: "Missing Document_Check_List_Master_Id" });
    }

    try {
        category.Delete_Document_Check_List(
            Document_Check_List_Master_Id,
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    res.status(200).json({ success: true, message: "Deleted successfully", data: rows[0] });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Delete Entire Check List Category
router.post('/Delete_Entire_Check_List_Category', function (req, res) {
    const { Check_List_Category_Id } = req.body;

    if (!Check_List_Category_Id) {
        return res.status(400).json({ success: false, message: 'Category ID is required' });
    }

    category.Delete_Entire_Check_List_Category(Check_List_Category_Id, function (err, rows) {
        if (err) {
            return res.status(500).json({ success: false, message: 'Database error', error: err });
        } else {
            return res.status(200).json({
                success: true,
                message: 'Category and its items deleted successfully',
                data: rows[0]
            });
        }
    });
});


// Save Document Check List Item 
router.post('/Save_Complete_Document_Check_List/', function(req, res, next) {
    const { checkListData, items } = req.body;
    console.log("req.body",req.body);
    

    if (!checkListData || !items || !Array.isArray(items)) {
        return res.status(400).json({ success: false, message: "Invalid payload structure." });
    }

    const {
        Document_Check_List_Master_Id,
        Entry_Date,
        User_Id,
        Usr_Name
    } = checkListData;

    const itemsJSON = JSON.stringify(items);

    try {
        category.Save_Complete_Document_Check_List(
            Document_Check_List_Master_Id,
            Entry_Date,
            User_Id,
            Usr_Name,
            itemsJSON,
            function(err, rows) {
                if (err) {
                    return res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    const action = Document_Check_List_Master_Id == 0 ? "Inserted" : "Updated";
                    return res.status(200).json({
                        success: true,
                        message: `${action} successfully`,
                        data: rows[0]
                    });
                }
            }
        );
        
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Search Attendance
router.post('/Search_Attendance', function(req, res, next) {
    const { Id_Date_Value, From_Date, To_Date } = req.body;

    try {
        category.Search_Attendance(
            Id_Date_Value,
            From_Date,
            To_Date,
            function(err, rows) {
                if (err) {
                    res.status(500).json({ success: false, message: "Database error", error: err });
                } else {
                    res.status(200).json({ success: true, data: rows[0] });
                }
            }
        );
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Get Attendance Details
router.get('/Get_Attendance_Details/', function(req, res) {
    const { Attendance_Master_Id } = req.body;

    if (!Attendance_Master_Id) {
        return res.status(400).json({ success: false, message: "Attendance_Master_Id is required" });
    }

    try {
        category.Get_Attendance_Details(Attendance_Master_Id, function(err, rows) {
            if (err) {
                return res.status(500).json({ success: false, message: "Database error", error: err });
            }
            res.status(200).json({ success: true, data: rows[0] });
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});

// Delete Attendance
router.post('/Delete_Attendance', function(req, res, next) {
    const { Attendance_Master_Id } = req.body;

    if (!Attendance_Master_Id) {
        return res.status(400).json({ success: false, message: "Attendance_Master_Id is required" });
    }

    try {
        category.Delete_Attendance(Attendance_Master_Id, function(err, rows) {
            if (err) {
                res.status(500).json({ success: false, message: "Database error", error: err });
            } else {
                res.status(200).json({ success: true, message: rows[0].message || "Deleted successfully" });
            }
        });
    } catch (e) {
        res.status(500).json({ success: false, message: "Internal server error", error: e.message });
    }
});


module.exports = router;