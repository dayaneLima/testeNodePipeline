/**
 * Required External Modules
 */
// import http from 'http';
import * as dotenv from "dotenv";
import express, { Express } from "express";
import cors from "cors";
import helmet from "helmet";
import routesLogin from './routes/login';

const router: Express = express();
dotenv.config();

/**
 * App Variables
 */
 
const app = express();

/**
 *  App Configuration
 */

app.use(helmet());
app.use(cors());
router.use(express.urlencoded({ extended: false }));
app.use(express.json());

/** RULES OF OUR API */
router.use((req, res, next) => {
    // set the CORS policy
    res.header('Access-Control-Allow-Origin', '*');
    // set the CORS headers
    res.header('Access-Control-Allow-Headers', 'origin, X-Requested-With,Content-Type,Accept, Authorization');
    // set the CORS method headers
    if (req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods', 'GET PATCH DELETE POST');
        return res.status(200).json({});
    }
    next();
});

/** Routes */
router.use('/', routesLogin);

/** Error handling */
router.use((req, res) => {
    const error = new Error('not found');
    return res.status(404).json({
        message: error.message
    });
});


/**
 * Server Activation
 */

app.use('/', router);

export default app;