
// in this file we will work with the file system

const fs = require("fs");

// synchronously read a file
const data = fs.readFileSync("./data.txt", "utf-8");

console.log("data:", data);


