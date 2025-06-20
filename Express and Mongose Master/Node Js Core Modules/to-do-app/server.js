

const http = require("http");
const fs = require("fs");
const path = require("path");


var dir = path.join(__dirname, "db/todo.json"); // __dirname is the directory name of the current module
const fileContent = fs.readFileSync(dir, {encoding:"utf-8"}); // read the file

const server = http.createServer((request, response) =>{
    // console.log("Request: ", request );
    // console.log("Response: ", response);
   
    if(request.url === "/" &&  request.method === "GET") 
    {
        response.end("<h1>Welcome to HomePage</h1>")
    }
    else if(request.url === "/allTodos" && request.method === "GET")
    {
        response.writeHead(200, {
            "content-type": "application/json",
            "another_header": "custom_value",
        })
        // writeHead is used to set the status code and headers of the response

        response.end(fileContent); // show file content in the browser after reading the file
    }
    else if(request.url === "/create-todo" && request.method === "POST")
    {
        response.writeHead(201,{
            "content-type": "application/json",

        })
        
        var data = "";
        request.on("data", (chunk)=> // "data" event is emitted when a chunk of data is available to read
            {
                data += chunk; // data is a json format string
            }
        )
        request.on("end", ()=>{
            const prevTodos = JSON.parse(fileContent); // parse the json string to an array of objects
            const newTodo = JSON.parse(data); // parse the json string to an object
            prevTodos.push(newTodo); // add the new todo to the array of todos
            fs.writeFileSync(dir, JSON.stringify(prevTodos,null,2),{encoding:"utf-8"}); // write the updated array of todos to the file
            response.end(data); // send the new todo back to the client
        })
    }
    else{
        response.end("<h1>404 Not Found</h1>");
        console.log(request.url)
    }
});


server.listen(3000, '127.0.0.1', ()=>{
    console.log("Server is running ✔");
})
/*
    formula:
    1. Import the http module.
    2. Create an HTTP server using http.createServer().
    3. Listen on a specific port and IP address.
*/