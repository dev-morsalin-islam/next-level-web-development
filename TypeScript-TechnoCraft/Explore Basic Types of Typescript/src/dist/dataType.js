"use strict";
// ########## Primitive Data Type #######
/*

    a. number
    b. String
    c. boolean
    d. null
    e. undefine
    f. symbol


*/
const age = 23;
console.log("age: ", age);
const myName = "Morsalin Islam";
console.log(myName);
const isQualified = true;
console.log(isQualified ? "I am qualified for job" : "I am not qualifile for job");
const parrent = null;
console.log("root's parrent will be ", parrent);
let CGPA;
console.log("CGPA : ", CGPA); // undefined
// ############ non primitive data type ######
/*
    a. array
    b. tuple
    c. object

*/
// ##### array #####
const algorithms = ["dijkstra", "bellman ford", "floyd wirshell", "prims"];
algorithms.push("0-1 Knapsack"); // it will work
// console.log(algorithms);
const algorithms2 = ["binary search", "merge sort", "heap sort"];
algorithms2.push(...algorithms); // keep algorithms variable all data in algorithms2 by using spreed operator and algorithms2 is a 2D array
// algorithms2.push(algorithms) ; // it wont work
const dataStructure = ["array", "linked list", "stack", "queue", "priority queue"];
const DSA = []; // define DSA as a 2D array
DSA.push(algorithms2, dataStructure);
console.log(DSA);
// #### tuple ###
var student = ["Morsalin Islam", 635675];
student[0] = "Dev. Morsalin Islam"; // it must be a string
console.log("student tuple : ", student);
// ########## object ######
var programmingLanguage = ["C", "C++", "Python", "Java", "JavaScript", "TypeScript"];
// const person : object = {
//     Name : "Morsalin Islam",
//     age : 20,
//     designation : "Backend Developer",
//     language: programmingLanguage
// }
const person = {
    Name: "Morsalin Islam",
    age: 20,
    designation: "Backend Developer",
    language: programmingLanguage
};
console.log("Person object : ", person);
