var express = require('express');
var router = express.Router();
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
      scanLogo=scanner+'.png';
  };
  res.render('index',
  {
    title: 'Quarantine Pattern',
    version: '6',
    scanLogo: scanLogo,
    scanner: scanner,
    content: 'Scan Succeeded'
  });
});
module.exports = router;
