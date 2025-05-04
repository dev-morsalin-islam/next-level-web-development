"use strict";
// by  using type assertion type assertion typescript will beliive you
var myNumber = 1000;
var lengthAfterNumberToString = myNumber.toString().length;
console.log(lengthAfterNumberToString);
const sumation = (num1, num2) => {
    if (typeof num1 == "string" && typeof num2 == "string") {
        return `sum ${parseFloat(num1) + parseFloat(num2)}`;
    }
    else if (typeof num1 == "number" && typeof num2 == "number") {
        return num1 + num2;
    }
    else
        return undefined;
};
const sum1 = sumation("100", "200"); // typeScript dont know what will be its data type but as a developer I know that it data type will be string
const sum2 = sumation(100, 2000); // same case
console.log(sum1);
console.log(sum2);
