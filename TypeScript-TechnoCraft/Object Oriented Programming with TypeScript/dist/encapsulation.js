"use strict";
{
    class Bank {
        constructor(balance) {
            this._balance = balance;
        }
        depositBalance(amount) {
            this._balance += amount;
            return this._balance;
        }
        withdrawalBalance(amount) {
            this._balance -= amount;
            return this._balance;
        }
        get getBalance() {
            return this._balance;
        }
        makeBankrupt() {
            this._balance = 0; //  set balance with 0
            return this._balance;
        }
    }
    const myBankAccount = new Bank(1000);
    console.log(myBankAccount.getBalance); // using getter
}
