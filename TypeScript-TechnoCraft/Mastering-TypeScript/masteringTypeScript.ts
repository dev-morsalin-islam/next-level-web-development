
// problem 1


function formatString(input: string, toUpper?:boolean): string{
    if (toUpper || typeof toUpper === "undefined") 
        return input.toUpperCase();
    else return input.toLocaleLowerCase();
}

// console.log(formatString("Hello",)); // it output will be HELLO
// console.log(formatString("Hello",true)); // it output will be HELLO
// console.log(formatString("Hello", false)); // it output will be hello



// problem 2


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




  // problem 3

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



// problem 4


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