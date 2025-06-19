
import express, { Application, Request, Response } from "express";

const app: Application = express();
const router1 = express.Router();

app.use("/router1", router1); // Use the router for a specific path


app.use(express.json()); // Middleware to parse JSON bodies from incoming requests

router1.get("/", (request: Request, response: Response) => {
    response.json({
        message: "Hello from router1!"
    })
})
app.get("/", (request: Request, response: Response) =>{
    console.log(request.path);
    response.send("Learning TypeScript with Express.js");
})
// another methods get,post, patch, delete

app.post("/createToDo", (request: Request, response: Response)=>{
    console.log(request.body);
   
    response.send(request.body);
})

export default app;
