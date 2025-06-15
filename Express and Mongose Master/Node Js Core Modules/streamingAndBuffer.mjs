

// streaming and buffering  example

// streaming are basically 2 types, readable and writable streams

import fs from "fs";

const readStream = fs.createReadStream("./txt-file1.txt", {encoding: "utf-8"});

const writeStream = fs.createWriteStream("./txt-file21.txt", {encoding: "utf-8"});

// readStream is an event emitter, it emits data events when data is available to read 


readStream.on("data", (chunkData) =>
{
    writeStream.write(chunkData, (error)=>{
        if(error) throw Error("Error writing to file:", error);
    })
});

readStream.on("error", (error)=>{
    console.error("Error reading from file:", error);
})
writeStream.on("error", (error)=>{
    console.error("Error writing to file:", error);
});