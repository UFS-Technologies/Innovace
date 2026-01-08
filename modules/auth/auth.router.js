const express = require('express');
const router = express.Router();
const auth = require('./auth.controller');
router.post('/login', auth.login);
router.get('/forgot',auth.ForgetPassword)
module.exports = router;
