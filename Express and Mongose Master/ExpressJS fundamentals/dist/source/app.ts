
import express, { Application, Request, Response } from "express";

const app: Application = express();

app.get("/", (request: Request, response: Response) =>{
    response.send("Hello world");
})
// another methods get,post, patch, delete

export default app;
