var express = require('express');
var router = express.Router();
const users = require('../services/users');

/* GET users listing. */
router.get('/get-users-code/:code', async function(req, res, next) {
  try {
    let params = JSON.parse(JSON.stringify(req.params)); 
    let code = params.code;
    let respon = await users.getUsers(code);
    res.json(respon);
  } catch (err) {
    console.error(`Error while getting users `, err.message);
    next(err);
  }
});

router.get('/get-users-with-friends', async function(req, res, next) {
  try {
    // let params = JSON.parse(JSON.stringify(req.params)); 
    // let code = params.code;
    let respon = await users.getUsersWithFrnds();
    res.json(respon);
  } catch (err) {
    console.error(`Error while getting users `, err.message);
    next(err);
  }
});

module.exports = router;
