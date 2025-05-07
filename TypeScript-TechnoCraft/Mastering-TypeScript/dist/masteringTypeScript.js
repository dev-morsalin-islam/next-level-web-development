"use strict";
// problem 1
function formatString(input, toUpper) {
    if (toUpper || typeof toUpper === "undefined")
        return input.toUpperCase();
    else
        return input.toLocaleLowerCase();
}
console.log(formatString("hello", false));
