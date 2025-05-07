"use strict";
// problem 1
function formatString(input, toUpper) {
    if (toUpper || typeof toUpper === "undefined")
        return input.toUpperCase();
    else
        return input.toLocaleLowerCase();
}
// console.log(formatString("Hello",)); // it output will be HELLO
// console.log(formatString("Hello",true)); // it output will be HELLO
// console.log(formatString("Hello", false)); // it output will be hello
// problem 2
function filterByRating(items) {
    const itemsWithHighestRating = items.filter(item => (item.rating >= 4));
    return itemsWithHighestRating;
}
const books = [
    { title: "Book A", rating: 4.5 },
    { title: "Book B", rating: 3.2 },
    { title: "Book C", rating: 5.0 }
];
//   console.log(filterByRating(books)); // output will be [ { title: 'Book A', rating: 4.5 }, { title: 'Book C', rating: 5 } ]
// problem 3
function concatenateArrays(...arrays) {
    var primaryArray = [];
    arrays.forEach(array => {
        primaryArray = primaryArray.concat(array);
    });
    return primaryArray;
}
//   console.log(concatenateArrays<string>(["a", "b"], ["c"])); // output will be [ 'a', 'b', 'c' ]
//   console.log(concatenateArrays<number>([10, 20], [30])); // output will be [10, 20, 30]
// problem 4
class Vehicle {
    // make constructor to assign private property
    constructor(make, year) {
        this._make = make;
        this._year = year;
    }
    getInfo() {
        console.log(`Make: ${this._make}, Year: ${this._year}`);
    }
}
class Car extends Vehicle {
    constructor(make, year, model) {
        super(make, year);
        this._model = model;
    }
    getModel() {
        console.log(`Model: ${this._model}`);
    }
}
// const myCar = new Car("Toyota", 2020, "Corolla");
// myCar.getInfo(); // Output: "Make: Toyota, Year: 2020"
// myCar.getModel(); // Output: "Model: Corolla"
// working with type guard
function processValue(value) {
    if (typeof value == "string")
        return value.length;
    return value * 2;
}
// retrieve most expensive product
function getMostExpensiveProduct(products) {
    if (products.length == 0) {
        return null;
    }
    var mostExpensiveProduct = products[0]; // assume 0th index product is most expensive
    for (let i = 0; i < products.length; i++) {
        if (products[i].price >= mostExpensiveProduct.price) {
            mostExpensiveProduct = products[i]; // reassign most expensive product
        }
    }
    return mostExpensiveProduct;
}
const products = [
    { name: "Pen", price: 10 },
    { name: "Notebook", price: 25 },
    { name: "Bag", price: 50 }
];
console.log(getMostExpensiveProduct(products));
