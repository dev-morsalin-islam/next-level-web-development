


{

    class Bank{
        private _balance: number;
        
        constructor(balance: number){
            this._balance = balance;
        }


        depositBalance(amount: number){
            this._balance += amount;
            return this._balance;
        }

        withdrawalBalance(amount: number){
            this._balance -= amount;
            return this._balance;
        }

        get getBalance(){ // this is getter
            return this._balance;
        }

        makeBankrupt(){
            this._balance = 0; //  set balance with 0
            return this._balance;
        }


         
    }


    const myBankAccount = new Bank(1000);
    console.log(myBankAccount.getBalance); // using getter
    
    
}