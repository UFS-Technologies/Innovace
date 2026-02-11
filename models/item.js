const db = require('../dbconnection'); // Assuming you have a db connection module

const itemModel = {
    create_Item: function(itemData, callback) {
        const { itemId, itemName, categoryId, categoryName, unitId, unitName, cgst, sgst, gst, igst, itemMaterials } = itemData;
        const itemMaterialsJSON = JSON.stringify(itemMaterials);

        return db.query(
            "CALL Create_Item(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [itemId, itemName, categoryId, categoryName, unitId, unitName, cgst, sgst, gst, igst, itemMaterialsJSON],
            callback
        );
    },


    // save_purchase_details: function (purchaseData, callback) {
    //     const {
    //         supplierId,
    //         supplierName,
    //         supplierAddress,
    //         invoiceNo,
    //         invoiceDate,
    //         itemId,
    //         itemName,
    //         categoryId,
    //         categoryName,
    //         unitName,
    //         unitId,
    //         quantity,
    //         price,
    //         discount,
    //         cgst,
    //         sgst,
    //         gst,
    //         totalAmount,
    //         Purchase_Details_Id
    //     } = purchaseData;
    
    //     return db.query(
    //         "CALL save_purchase_details(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)",
    //         [
    //             supplierId,
    //             supplierName,
    //             supplierAddress,
    //             invoiceNo,
    //             invoiceDate,
    //             itemId,
    //             itemName,
    //             categoryId,
    //             categoryName,
    //             unitName,
    //             unitId,
    //             quantity,
    //             price,
    //             discount,
    //             cgst,
    //             sgst,
    //             gst,
    //             totalAmount,
    //             Purchase_Details_Id
    //         ],
    //         callback
    //     );
    // },
    save_purchase_details: function (purchaseData, callback) {
        const {
            purchase_date,
            party_id,
            invoice_no,
            total_amount,
            total_cgst,
            total_sgst,
            total_gst,
            grand_total,
            description,
            details
        } = purchaseData;

        // Convert details array to JSON string
        const detailsJson = JSON.stringify(details.map(detail => ({
            item_id: detail.item_id,
            stock_id: detail.stock_id,
            item_name: detail.item_name,
            category_id: detail.category_id,
            category_name: detail.category_name,
            unit_name: detail.unit_name,
            unit_id: detail.unit_id,
            quantity: detail.quantity,
            price: detail.price,
            amount: detail.amount,
            discount: detail.discount || 0,
            netvalue: detail.netvalue,
            cgst: detail.cgst || 0,
            sgst: detail.sgst || 0,
            gst: detail.gst || 0,
            total_amount: detail.total_amount
        })));
        console.log('detailsJson: ', detailsJson);
        return db.query(
            "CALL save_purchase_details(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
                purchase_date,
                party_id,
                invoice_no,
                total_amount,
                total_cgst,
                total_sgst,
                total_gst,
                grand_total,
                description,
                detailsJson
              
            ],
           
            callback
            
        );
      
    }
,
    save_stock: function (stockData, callback) {
        const {
            Stock_Id,
            Customer_Id,
            Customer_Name,
            Entry_Date,
            Item_Id,
            Item_Name,
            Unit_Id,
            Unit_Name,
            Category_Id,
            Category_Name,
            Rate,
            GST,
            Quantity,
            Amount,
        } = stockData;
    
        return db.query(
            "CALL Save_Stock(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
                Stock_Id,
                Customer_Id,
                Customer_Name,
                Entry_Date,
                Item_Id,
                Item_Name,
                Unit_Id,
                Unit_Name,
                Category_Id,
                Category_Name,
                Rate,
                GST,
                Quantity,
                Amount,
            ],
            callback
        );
    },
    

    save_expense_management: function (expenseData, callback) {
        const {
            Expense_Management_Id,
            Expense_Type,
            Task,
            Amount,
            Entry_Date,
            File_Path,
            DeleteStatus
        } = expenseData;

        return db.query(
            "CALL save_expense_management( ?, ?, ?, ?, ?, ?, ?)",
            [
                Expense_Management_Id,
                Expense_Type,
                Task,
                Amount,
                Entry_Date,
                File_Path,
                DeleteStatus
            ],
            callback
        );
    },

     saveSolarPanelDetails : function (data, callback) {
        const {
            Solar_Panel_Details_Id,
            Task_Id,
            DCSPD_Id,
            DCSPD_Name,
            DC_Fuse_Id,
            DC_Fuse_Name,
            Make,
            AMP,
            PB1,
            PB2,
            PB3,
            PB4,
            ACSPD_Id,
            ACSPD_Name,
            ACMCB_Id,
            ACMCB_Name,
            AC_Volt,
            Phase_To_Earth,
            Neutral_To_Earth,
            Inverter_Status,
            Panel_Status,
            Summary,
            Customer_Sign,
            Service_Eng_Sign
            
        } = data;
    
        return db.query(
            "CALL save_solar_panel_details(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)",
            [
                Solar_Panel_Details_Id,
                Task_Id,
                DCSPD_Id,
                DCSPD_Name,
                DC_Fuse_Id,
                DC_Fuse_Name,
                Make,
                AMP,
                PB1,
                PB2,
                PB3,
                PB4,
                ACSPD_Id,
                ACSPD_Name,
                ACMCB_Id,
                ACMCB_Name,
                AC_Volt,
                Phase_To_Earth,
                Neutral_To_Earth,
                Inverter_Status,
                Panel_Status,
                Summary,
                Customer_Sign,
                Service_Eng_Sign
                
            ],
            callback
        );
    },
   
    

    getAllItems: function(callback) {
        return db.query(
            "CALL Get_All_Items()",
            [],
            callback
        );
    },

    get_expense_management: function (callback) {
        return db.query("CALL get_expense_management()", callback);
    },

    get_solar_panel_details: function (Task_Id_, callback) {
        return db.query("CALL get_solar_panel_details(?)", [Task_Id_], callback);
    },

    get_all_stocks: function(callback) {
        return db.query(
            "CALL get_all_stocks()",
            [],
            callback
        );
    },
    get_all_suppliers: function(callback) {
        return db.query(
            "CALL get_all_suppliers()",
            [],
            callback
        );
    },

    getItemDetails: function(itemId, callback) {
        return db.query(
            "CALL Get_Item_Details(?)",
            [itemId],
            callback
        );
    },

    delete_item_details: function(itemId, callback) {
        return db.query(
            "CALL delete_item_details(?)",
            [itemId],
            callback
        );
    },

    get_purchase_details: function(callback) {
        return db.query(
            "CALL get_purchase_details()",
            [],
            callback
        );
    },

// Save or update expense type
save_expense_type: function (expenseTypeData, callback) {
    const { Expense_Type_Id, Expense_Type_Name } = expenseTypeData;

    return db.query(
        "CALL save_expense_type(?, ?)",
        [Expense_Type_Id, Expense_Type_Name],
        callback
    );
},

// Get all expense types
get_expense_types: function (callback) {
    return db.query("CALL get_expense_types()", [], callback);
},

Delete_Expense_Type:function(Expense_Type_Id_,callback)
{ 
return db.query("CALL Delete_Expense_Type(@Expense_Type_Id_ :=?)",[Expense_Type_Id_],callback);
}
,
Save_Category: function (categoryData, callback) {
    const { Category_Id, Category_Name } = categoryData;

    return db.query(
        "CALL Save_Category(?, ?)",
        [Category_Id, Category_Name],
        callback
    );
},
   getAllCategory: function(callback) {
        return db.query(
            "CALL Get_All_category()",
            [],
            callback
        );
    },
    Delete_Category:function(Category_Id_,callback)
    { 
    return db.query("CALL Delete_Category(@Category_Id_ :=?)",[Category_Id_],callback);
    },
    Save_Unit: function (unitData, callback) {
    const { Unit_Id, Unit_Name } = unitData;

    return db.query(
        "CALL Save_Unit(?, ?)",
        [Unit_Id, Unit_Name],
        callback
    );
},
getAllunit: function(callback) {
    return db.query(
        "CALL Get_All_unit()",
        [],
        callback
    );
},
Delete_Unit:function(Unit_Id_,callback)
    { 
    return db.query("CALL Delete_Unit(@Unit_Id_ :=?)",[Unit_Id_],callback);
    },
    




    
};

module.exports = itemModel; 
