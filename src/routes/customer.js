const router = require('express').Router();

const customerController = require('../controllers/customerController');

router.get('/', customerController.list);
router.post('/add', customerController.save);
router.get('/update/:IdMateria', customerController.edit);
router.post('/update/:IdMateria', customerController.update);
router.get('/delete/:IdMateria', customerController.delete);

module.exports = router;

