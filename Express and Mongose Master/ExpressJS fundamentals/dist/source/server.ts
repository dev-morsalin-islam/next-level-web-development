
import app from "./app";

let server;
const port = 5000; // 5000 port

const runServer = async ()=>{
    server = app.listen(port, ()=>{
        console.log(`app listening form ${port} port number`);

    })

}

runServer();
