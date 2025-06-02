

const http = require("http");

const server = http.createServer((request, response) =>{
    response.end("Hello World! This is a simple HTTP server");
});


server.listen(3000, '127.0.0.1', ()=>{
    console.log("Server is running ✔");
})