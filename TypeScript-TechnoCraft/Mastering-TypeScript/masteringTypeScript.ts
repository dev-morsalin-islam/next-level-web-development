

// ########### working with optional parameter and type guard ##############

function formatString(input: string, toUpper?:boolean): string{
    if (toUpper || typeof toUpper === "undefined") 
        return input.toUpperCase();
    else return input.toLocaleLowerCase();
}

// console.log(formatString("Hello",)); // it output will be HELLO
// console.log(formatString("Hello",true)); // it output will be HELLO
// console.log(formatString("Hello", false)); // it output will be hello



// ###### filtering array of object inside function #######


function filterByRating(items: { title: string; rating: number }[]) 
: { title: string; rating: number }[]
{
    const itemsWithHighestRating = items.filter(item => (item.rating >= 4));
    return itemsWithHighestRating;
}


const books = [
    { title: "Book A", rating: 4.5 },
    { title: "Book B", rating: 3.2 },
    { title: "Book C", rating: 5.0 }
  ];
  
//   console.log(filterByRating(books)); // output will be [ { title: 'Book A', rating: 4.5 }, { title: 'Book C', rating: 5 } ]




  // ######## concat multiple array receive from ...rest params ########

  function concatenateArrays<T>(...arrays: T[][]): T[]
  {
    var primaryArray: T[] = [];
    arrays.forEach(array => {
        primaryArray = primaryArray.concat(array);
    })

    return primaryArray;
  }


//   console.log(concatenateArrays<string>(["a", "b"], ["c"])); // output will be [ 'a', 'b', 'c' ]
//   console.log(concatenateArrays<number>([10, 20], [30])); // output will be [10, 20, 30]



// ######### working with inheritance and encapsulation ###########


class Vehicle{
    private _make: string;
    private _year: number;

    // make constructor to assign private property
    constructor(make: string, year: number){
        this._make = make;
        this._year = year;
    }

    getInfo(){
        console.log(`Make: ${this._make}, Year: ${this._year}`);
    }

}

class Car extends Vehicle{
    private _model: string;
    constructor(make: string, year: number, model: string){
        super(make, year);
        this._model = model;
    }

    getModel(){
        console.log(`Model: ${this._model}`);
    }
}

// const myCar = new Car("Toyota", 2020, "Corolla");
// myCar.getInfo(); // Output: "Make: Toyota, Year: 2020"
// myCar.getModel(); // Output: "Model: Corolla"




// working with type guard
function processValue(value: string | number): number
{
    if (typeof value == "string") return value.length;
    return value *  2;
}

// console.log(processValue("hello")); // output will be 5
// console.log(processValue(5)); // output will be   10



// ############### working with interface ##########

interface Product{
    name: string;
    price: number;
}

// retrieve most expensive product
function getMostExpensiveProduct(products: Product[]): Product | null
{
    if (products.length == 0){
        return null;
    }

    var  mostExpensiveProduct = products[0]; // assume 0th index product is most expensive
    for(let i = 0; i < products.length; i++)
    {
        if(products[i].price >= mostExpensiveProduct.price){
            mostExpensiveProduct = products[i]; // reassign most expensive product
        }
    }
    return mostExpensiveProduct;
}

// const products = [
//     { name: "Pen", price: 10 },
//     { name: "Notebook", price: 25 },
//     { name: "Bag", price: 50 }
//   ];
  
//   console.log(getMostExpensiveProduct(products));  // output will be =>  { name: "Bag", price: 50 }




// ############ working with enum object ###########

enum Day {
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
  }


function getDayType(day: Day): string
{
    if (day === Day.Sunday || day === Day.Saturday){
        return `Weekend`;
    }
    return "Weekday";
}

// console.log(getDayType(Day.Monday)); // output will be Weekday


// ################ working with asynchronous task ################
async function squareAsync(n: number): Promise<number>
{
    const promise = new Promise<number>((resolve, reject) =>{
        setTimeout(()=>{
            if (n >= 0){
                resolve(n * n);
            }
            else reject("Error: Negative");
        }, 1000)
    })
    return promise;
}

// squareAsync(4).then(console.log); // after 1 second latter it will give 16 as output
// squareAsync(-3).catch(console.error); // after 1 second latter it will give error as output

