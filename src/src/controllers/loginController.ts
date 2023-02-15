import { Request, Response } from 'express';

const autenticar = async (req: Request, res: Response) => {
    return res.status(200).json({
        message: [{"teste": "Bem vindo"}]
    });
};

export default { autenticar };