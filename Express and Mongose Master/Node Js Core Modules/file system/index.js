
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




    // synchronously write to a file

    // fs.writeFileSync('./output.txt', "hello world", 'utf-8');



    // asynchronously write to a file

    fs.writeFile('./output.txt', "hello world from index.js", 'utf-8', (error) => {
        if(error) console.error("Error occoured while writing to file:", error);
    });


