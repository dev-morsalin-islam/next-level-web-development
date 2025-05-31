
// in this file we will work with the file system

const fs = require("fs");

// synchronously read a file
// const data = fs.readFileSync("./data.txt", "utf-8");

// console.log("data:", data);


// asynchronously read a file

 fs.readFile("./data.txt", 'utf-8', (error, data) => 
    {
        if(error) console.error("Error reading file:", error);
        else console.log("File data:", data);
        
    });


