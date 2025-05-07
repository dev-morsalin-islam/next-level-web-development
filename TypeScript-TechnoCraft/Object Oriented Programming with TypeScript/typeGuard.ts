

// type guard in typescript

{
    function sum(num1: number | string, num2: number | string): number | undefined{
        // return num1 + num2; // cant apply directly
        if(typeof num1 == "number" && typeof num2 == "number"){
            return num1 + num2; // 
        }

        else if(typeof num1 == "string" && typeof num2 == "string"){
            return parseInt(num1) + parseInt(num2);
        }

    }

    console.log(`number sum ${sum(10, 20)}`);
    console.log(`string sum ${sum("10", "20")}`);
}