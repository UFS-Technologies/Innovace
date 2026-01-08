const express = require("express");
const router = express.Router();
const itemModel = require('../models/item');

router.post('/create_Item', function(req, res, next) {
    try {
        const itemData = {
            itemId: req.body.itemId,
            itemName: req.body.itemName,
            categoryId: req.body.categoryId,
            categoryName: req.body.categoryName,
            unitId: req.body.unitId,
            unitName: req.body.unitName,
            cgst: req.body.cgst,
            sgst: req.body.sgst,
            gst: req.body.gst,
            igst: req.body.igst,
            itemMaterials: req.body.itemMaterials
        };

        itemModel.create_Item(itemData, function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to create or update item',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Item created or updated successfully',
                    data: result
                });
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
router.post('/save_purchase_details', function (req, res, next) {
    try {
        const masterData = {
            purchase_date: req.body.purchase_date,
            party_id: req.body.party_id,
            invoice_no: req.body.invoice_no,
            total_amount: req.body.total_amount,
            total_cgst: req.body.total_cgst || 0,
            total_sgst: req.body.total_sgst || 0,
            total_gst: req.body.total_gst || 0,
            grand_total: req.body.grand_total,
            description: req.body.description || '',
            details: req.body.details
        };

        // Validate that details is an array
        if (!Array.isArray(masterData.details)) {
            return res.status(400).json({
                success: false,
                message: 'Purchase details must be an array'
            });
        }

        itemModel.save_purchase_details(masterData, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to save purchase',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Purchase saved successfully',
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
// router.post('/save_purchase_details', function (req, res, next) {
//     try {
//         const purchaseData = {
//             Purchase_Details_Id: req.body.Purchase_Details_Id,
//             supplierId: req.body.supplierId,
//             supplierName: req.body.supplierName,
//             supplierAddress: req.body.supplierAddress,
//             invoiceNo: req.body.invoiceNo,
//             invoiceDate: req.body.invoiceDate,
//             itemId: req.body.itemId,
//             itemName: req.body.itemName,
//             categoryId: req.body.categoryId,
//             categoryName: req.body.categoryName,
//             unitName: req.body.unitName,
//             unitId: req.body.unitId,
//             quantity: req.body.quantity,
//             price: req.body.price,
//             discount: req.body.discount || 0,
//             cgst: req.body.cgst || 0,
//             sgst: req.body.sgst || 0,
//             gst: req.body.gst || 0,
//             totalAmount:req.body.totalAmount
//         };

//         itemModel.save_purchase_details(purchaseData, function (err, result) {
//             if (err) {
//                 res.status(500).json({
//                     success: false,
//                     message: 'Failed to save purchase details',
//                     error: err,
//                 });
//             } else {
//                 res.json({
//                     success: true,
//                     message: 'Purchase details saved successfully',
//                     data: result,
//                 });
//             }
//         });
//     } catch (e) {
//         res.status(500).json({
//             success: false,
//             message: 'Internal server error',
//             error: e.message,
//         });
//     }
// });

router.post('/save_stock', function (req, res, next) {
    try {
        const stockData = {
            Stock_Id: req.body.Stock_Id,
            Customer_Id: req.body.Customer_Id,
            Customer_Name: req.body.Customer_Name,
            Entry_Date: req.body.Entry_Date,
            Item_Id: req.body.Item_Id,
            Item_Name: req.body.Item_Name,
            Unit_Id: req.body.Unit_Id,
            Unit_Name: req.body.Unit_Name,
            Category_Id: req.body.Category_Id,
            Category_Name: req.body.Category_Name,
            Rate: req.body.Rate,
            GST: req.body.GST,
            Quantity: req.body.Quantity,
            Amount: req.body.Amount,
        };

        itemModel.save_stock(stockData, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to save stock details',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Stock details saved successfully',
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

router.post('/save_expense_management', function (req, res, next) {
    try {
        const expenseData = {
            Expense_Management_Id: req.body.Expense_Management_Id,
            Expense_Type: req.body.Expense_Type,
            Task: req.body.Task,
            Amount: req.body.Amount,
            Entry_Date: req.body.Entry_Date,
            File_Path: req.body.File_Path || null,
            DeleteStatus: req.body.DeleteStatus || 0,
        };

        itemModel.save_expense_management(expenseData, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to save expense management data',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Expense management data saved successfully',
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

router.post('/save_solar_panel_details', function(req, res, next) {
    try {
        const solarPanelData = {
            Solar_Panel_Details_Id: req.body.Solar_Panel_Details_Id || null, // handle insert or update
            Task_Id: req.body.Task_Id,
            DCSPD_Id: req.body.DCSPD_Id,
            DCSPD_Name: req.body.DCSPD_Name,
            DC_Fuse_Id: req.body.DC_Fuse_Id,
            DC_Fuse_Name: req.body.DC_Fuse_Name,
            Make: req.body.Make,
            AMP: req.body.AMP,
            PB1: req.body.PB1,
            PB2: req.body.PB2,
            PB3: req.body.PB3,
            PB4: req.body.PB4,
            ACSPD_Id: req.body.ACSPD_Id,
            ACSPD_Name: req.body.ACSPD_Name,
            ACMCB_Id: req.body.ACMCB_Id,
            ACMCB_Name: req.body.ACMCB_Name,
            AC_Volt: req.body.AC_Volt,
            Phase_To_Earth: req.body.Phase_To_Earth,
            Neutral_To_Earth: req.body.Neutral_To_Earth,
            Inverter_Status: req.body.Inverter_Status,
            Panel_Status: req.body.Panel_Status,
            Summary: req.body.Summary,
            Customer_Sign: req.body.Customer_Sign,
            Service_Eng_Sign: req.body.Service_Eng_Sign
        };

        // Call the model to save or update data
        itemModel.saveSolarPanelDetails(solarPanelData, function(err, result) {
            if (err) {
                return res.status(500).json({
                    success: false,
                    message: 'Failed to save solar panel details',
                    error: err
                });
            }
            return res.json({
                success: true,
                message: 'Solar panel details saved/updated successfully',
                data: result
            });
        });

    } catch (e) {
        return res.status(500).json({
            success: false,
            message: 'Internal server error',
            error: e.message
        });
    }
});


router.get('/get_expense_management', function (req, res, next) {
    try {
        itemModel.get_expense_management(function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch expense records',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Expense records fetched successfully',
                    data: result
                });
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

router.get('/get_solar_panel_details', function (req, res, next) {
    try {
        const Task_Id_ = req.query.Task_Id_;  // Get Task_Id_ from query parameters

        if (!Task_Id_) {
            return res.status(400).json({
                success: false,
                message: 'Task_Id_ is required'
            });
        }

        itemModel.get_solar_panel_details(Task_Id_, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch solar panel records',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Solar panel records fetched successfully',
                    data: result
                });
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







// Get All Items
router.get('/get_all_items', function(req, res, next) {
    try {
        itemModel.getAllItems(function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch items',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Items fetched successfully',
                    data: result[0] // MySQL2 returns result set in first element
                });
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

// Get All Stocks
router.get('/get_all_stocks', function(req, res, next) {
    try {
        itemModel.get_all_stocks(function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch items',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Items fetched successfully',
                    data: result[0] // MySQL2 returns result set in first element
                });
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

// Get Item Details
router.get('/get_item_details/:itemId', function(req, res, next) {
    try {
        const itemId = req.params.itemId;
        console.log(itemId);
        itemModel.getItemDetails(itemId, function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch item details',
                    error: err
                });
            } else {
                if (result[0] && result[0].length > 0) {
                    // Parse the JSON string of itemMaterials back to an array 
                    const itemDetails = result[0][0];
                    itemDetails.itemMaterials =itemDetails.itemMaterials;
                    
                    res.json({
                        success: true,
                        message: 'Item details fetched successfully', 
                        data: itemDetails 
                    }); 
                } else {
                    res.status(404).json({
                        success: false,
                        message: 'Item not found'
                    }); 
                }
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


router.get('/delete_item_details/:itemId', function(req, res, next) {
    try {
        const itemId = req.params.itemId;
        console.log(itemId);
        itemModel.delete_item_details(itemId, function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch item details',
                    error: err
                });
            } else {
                if (result[0] && result[0].length > 0) {
                    // Parse the JSON string of itemMaterials back to an array 
                    const itemDetails = result[0][0];
                    itemDetails.itemMaterials =itemDetails.itemMaterials;
                    
                    res.json({
                        success: true,
                        message: 'Item deleted successfully', 
                        data: itemDetails 
                    }); 
                } else {
                    res.status(404).json({
                        success: false,
                        message: 'Item not found'
                    }); 
                }
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

router.get('/get_all_suppliers', function(req, res, next) {
    try {
        itemModel.get_all_suppliers(function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch suppliers',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'Suppliers fetched successfully',
                    data: result[0] // MySQL2 returns result set in first element
                });
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

router.get('/get_purchase_details', function(req, res, next) {
    try {
        itemModel.get_purchase_details(function(err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch purchase Details',
                    error: err
                });
            } else {
                res.json({
                    success: true,
                    message: 'purchase Details successfully',
                    data: result[0] // MySQL2 returns result set in first element
                });
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


// Create or update an expense type
router.post('/save_expense_type', function (req, res, next) {
    try {
        const expenseTypeData = {
            Expense_Type_Id: req.body.Expense_Type_Id || null,
            Expense_Type_Name: req.body.Expense_Type_Name
            
        };

        itemModel.save_expense_type(expenseTypeData, function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to save expense type',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Expense type saved successfully',
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

// Get all expense types
router.get('/get_expense_types', function (req, res, next) {
    try {
        itemModel.get_expense_types(function (err, result) {
            if (err) {
                res.status(500).json({
                    success: false,
                    message: 'Failed to fetch expense types',
                    error: err,
                });
            } else {
                res.json({
                    success: true,
                    message: 'Expense types fetched successfully',
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

router.delete('/Delete_Expense_Type/:Expense_Type_Id_?',function(req,res,next)
{ 
try 
{
    itemModel.Delete_Expense_Type(req.params.Expense_Type_Id_, function (err, rows) 
{
 if (err) 
 {
 res.json(err);
 }
 else 
 {
   res.json(rows[0][0]);
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