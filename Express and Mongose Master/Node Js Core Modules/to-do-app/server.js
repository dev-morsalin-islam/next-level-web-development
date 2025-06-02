

const http = require("http");

const server = http.createServer((request, response) =>{
    // console.log("Request: ", request );
    // console.log("Response: ", response);
   
    if(request.url === "/" &&  request.method === "GET") 
    {
        response.end("<h1>Welcome to HomePage</h1>")
    }
    else if(request.url === "/allTodos" && request.method === "GET")
    {
        response.end("<h1> All Todos</h1>")
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