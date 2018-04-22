var express = require('express');

var router = express.Router();

var os = require('os')
var http = require("http");
var scanner = process.env.SCANNER || 'none'

/* GET home page. */
router.get('/', function(req, res, next) {
  switch (scanner) {
    case 'aqua':
      scanLogo='aqua-logo.png';
      break;
    case 'twistlock':
      scanLogo='twistlock-logo.png';
      break;
    default:
      throw error;
  };
  res.render('index',
  {
    title: 'Quarantine Pattern',
    scanLogo: scanLogo,
    scanner: scanner,
    content: 'Scan Succeeded'
  });
});
/*    scanLogo: 'twistlock-logo.png', */


module.exports = router;
