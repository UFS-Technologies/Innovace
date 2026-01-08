var db = require('../dbconnection');
var fs = require('fs');

var category = {
    
    // Get Check Listing Category
    Get_Check_Lst_Category: function (callback) {
        return db.query("CALL Get_Check_Lst_Category()", callback);
    },
    // Get Check Listing Items
    Get_Document_Check_List_Details: function(masterId, callback) {
        return db.query("CALL Get_Document_Check_List_Details(?)", [masterId], callback);
    }
    ,
    // Get Check Listing Items with master ID
    Get_Check_List_Item_Category: function (documentCheckListMasterId, callback) {
        return db.query(
            "CALL Get_Check_List_Item_Category(?)",
            [documentCheckListMasterId],
            callback
        );
    },
    // CRUD Check_List_Category
    Save_Check_List_Category: function (categoryId, categoryName, callback) {
        return db.query(
            "CALL Save_Check_List_Category(?, ?)",
            [categoryId, categoryName],
            callback
        );
    },
    // Delete Check List Category
    Delete_Check_List_Category: function (categoryId, callback) {
        return db.query(
            "CALL Delete_Check_List_Category(?)",
            [categoryId],
            callback
        );
    },
    // CRUD Check_Item_Category
    Save_Check_List_Item: function (itemId, itemName, categoryId, callback) {
        return db.query(
            "CALL `Save_Check_List_Item`(?, ?, ?)",
            [itemId, itemName, categoryId],
            callback
        );
    },
    // Delete Check List Item
    Delete_Check_List_Item: function (itemId, callback) {
        return db.query(
            "CALL Delete_Check_List_Item(?)",
            [itemId],
            callback
        );
    },
    // Search Check List Category
    Search_Check_List_Category: function (categoryName, callback) {
        return db.query(
            "CALL Search_Check_List_Category(?)",
            [categoryName],
            callback
        );
    },
    // Search Check List Item
    Search_Check_List_Item: function (itemName, categoryId, callback) {
        return db.query(
            "CALL Search_Check_List_Item(?, ?)",
            [itemName, categoryId],
            callback
        );
    },
    // Save Document Check List
    Save_Document_Check_List: function (documentCheckListId, isCheckList, itemId, itemName, categoryId, categoryName, isCheckListComplete, callback) {
        return db.query(
            "CALL Save_Document_Check_List(?, ?, ?, ?, ?, ?, ?)",
            [documentCheckListId, isCheckList, itemId, itemName, categoryId, categoryName, isCheckListComplete],
            callback
        );
    },
    // Save Document Check List Master
    Save_Document_Check_List_Master: function (documentCheckListMasterId, entryDate, userId, usrName, documentCheckList, callback) {
        return db.query(
            "CALL Save_Document_Check_List_Master(?, ?, ?, ?, ?)",
            [documentCheckListMasterId, entryDate, userId, usrName, JSON.stringify(documentCheckList)],
            callback
        );
    },
    // Search Document Check List Master
    Search_Document_Check_List: function (masterId, entryDate, userId, userName, callback) {
        return db.query(
            "CALL Search_Document_Check_List(?, ?, ?, ?)",
            [masterId, entryDate, userId, userName],
            callback
        );
    },
    // Delete Document Check List
    Delete_Document_Check_List: function (masterId, callback) {
        return db.query(
            "CALL Delete_Document_Check_List(?)",
            [masterId],
            callback
        );
    },
    // Search Attendance
    Search_Attendance: function (Id_Date_Value, From_Date, To_Date, callback) {
        return db.query(
            "CALL Search_Attendance(?, ?, ?)",
            [Id_Date_Value, From_Date, To_Date],
            callback
        );
    },
    // Save_Complete_Document_Check_List
    Save_Complete_Document_Check_List: function (
        Document_Check_List_Master_Id,
        Entry_Date,
        User_Id,
        Usr_Name,
        itemsJSON,
        callback
    ) {
        return db.query(
            "CALL Save_Complete_Document_Check_List(?, ?, ?, ?, ?)",
            [
                Document_Check_List_Master_Id,
                Entry_Date,
                User_Id,
                Usr_Name,
                itemsJSON
            ],
            callback
        );
    },
    // Delete Check List Category By ID
    Delete_Entire_Check_List_Category: function (categoryId, callback) {
        return db.query("CALL Delete_Entire_Check_List_Category(?)", [categoryId], callback);
    },    
    // Get Attendance Details
    Get_Attendance_Details: function (masterId, callback) {
        return db.query("CALL Get_Attendance_Details(?)", [masterId], callback);
    },
    // Delete Attendance
    Delete_Attendance: function (attendanceMasterId, callback) {
        return db.query(
            "CALL Delete_Attendance(?)",
            [attendanceMasterId],
            callback
        );
    },
    // Get Document Check List
    Get_Document_Check_List: function (documentCheckListMasterId, entryDate, userId, usrName, callback) {
        return db.query(
            "CALL Get_Document_Check_List(?, ?, ?, ?)",
            [documentCheckListMasterId, entryDate, userId, usrName],
            callback
        );
    }






};


module.exports = category;