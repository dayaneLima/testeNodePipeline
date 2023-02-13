import { Request, Response, NextFunction } from 'express';

const autenticar = async (req: Request, res: Response, next: NextFunction) => {
    return res.status(200).json({
        message: [{"teste": "Bem vindo"}]
    });
};

export default { autenticar };