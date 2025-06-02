

const http = require("http");
const fs = require("fs");
const path = require("path");


var dir = path.join(__dirname, "db/todo.json");
const fileContent = fs.readFileSync(dir, {encoding:"utf-8"});

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

        response.end(fileContent);
    }
    else if(request.url === "/createTodo" && request.method === "POST")
    {
        response.end("<h1> Create Todo</h1>")
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