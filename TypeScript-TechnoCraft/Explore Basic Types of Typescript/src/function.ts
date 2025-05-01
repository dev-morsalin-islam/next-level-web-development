
// ################ 2 types of function
/* 
    1. normal function
    2. arrow function
*/
function summation(num1: number, num2: number): number {
    return num1 + num2;

}


const sum = (num1: number, num2: number): number => num1 + num2;

console.log(summation(10, 20));
console.log(sum(20,30));



//########## method inside object

const user : {
    username: string,
    balance: number,
    password: string
    addBalance: (amount: number) => number

    
} ={
    username: "morsalin",
    balance : 0,
    password: "1234",
    addBalance(balance: number): number{
        this.balance += balance;
        return this.balance;


    }
}


console.log(user.addBalance(1000));
