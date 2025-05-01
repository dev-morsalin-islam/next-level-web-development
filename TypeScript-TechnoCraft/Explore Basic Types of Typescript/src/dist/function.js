"use strict";
// ################ 2 types of function
/*
    1. normal function
    2. arrow function
*/
function summation(num1, num2) {
    return num1 + num2;
}
const sum = (num1, num2) => num1 + num2;
console.log(summation(10, 20));
console.log(sum(20, 30));
//########## method inside object
const user = {
    username: "morsalin",
    balance: 0,
    password: "1234",
    addBalance(balance) {
        this.balance += balance;
        return this.balance;
    }
};
console.log(user.addBalance(1000));
