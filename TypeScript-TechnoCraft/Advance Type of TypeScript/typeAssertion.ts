
// by  using type assertion type assertion typescript will beliive you



var myNumber: number = 1000;

var lengthAfterNumberToString: number = myNumber.toString().length ;

console.log(lengthAfterNumberToString)





const sumation = (num1: string | number, num2: string | number): string | number | undefined =>{
    if (typeof num1 == "string" && typeof num2 == "string"){
        return `sum ${parseFloat(num1) + parseFloat(num2)}`;
    }
    else if (typeof num1 == "number" && typeof num2 == "number"){
        return num1 + num2;
    }
    else return undefined;
}


const sum1: string = sumation("100", "200") as string; // typeScript dont know what will be its data type but as a developer I know that it data type will be string

const sum2: number = sumation(100, 2000) as number; // same case

console.log(sum1)
console.log(sum2);


