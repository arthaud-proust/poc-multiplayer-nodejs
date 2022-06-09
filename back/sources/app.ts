import express, { Express, Request, Response } from 'express';
import { Game } from './models/game';

const app: Express = express();
const port = parseInt(process.env.PORT ?? "80");

const game = new Game({
    name: 'ExampleGame'
});

app.get('/', (req: Request, res: Response) => {
    console.log(game);
    
    res.send('Express + TypeScript Server');
});

app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});