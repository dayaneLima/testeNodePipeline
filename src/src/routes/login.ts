import express from 'express';
import controller from '../controllers/loginController';
const router = express.Router();

router.post('/login', controller.autenticar);

export default router;