"use strict";
// type guard in typescript
{
    function sum(num1, num2) {
        // return num1 + num2; // cant apply directly
        if (typeof num1 == "number" && typeof num2 == "number") {
            return num1 + num2; // 
        }
        else if (typeof num1 == "string" && typeof num2 == "string") {
            return parseInt(num1) + parseInt(num2);
        }
    }
    console.log(`number sum ${sum(10, 20)}`);
    console.log(`string sum ${sum("10", "20")}`);
}
