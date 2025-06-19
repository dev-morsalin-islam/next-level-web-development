"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const router1 = express_1.default.Router();
app.use("/router1", router1); // Use the router for a specific path
app.use(express_1.default.json()); // Middleware to parse JSON bodies from incoming requests
router1.get("/", (request, response) => {
    response.json({
        message: "Hello from router1!"
    });
});
app.get("/", (request, response) => {
    console.log(request.path);
    response.send("Learning TypeScript with Express.js");
});
// another methods get,post, patch, delete
app.post("/createToDo", (request, response) => {
    console.log(request.body);
    response.send(request.body);
});
exports.default = app;
