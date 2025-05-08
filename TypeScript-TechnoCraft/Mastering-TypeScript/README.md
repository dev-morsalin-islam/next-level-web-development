# TypeScript Important Concepts Which Developer Should Know.

## **Difference between interface and type**

### **Interface:**

- Interface is used to define custom data type, it describe the shape of an object.
- Class can directly inherit interface by using implements keyword.
- There is use a curly braces {} to define interface structure.

### **Type:**

- Type alias is used to define custom data type. It can represent object shape, union, primitive etc.
- Class can not extends a type but class can implement type.
- To define a type there is use a assignment operator ("=")

## Use of the keyof keyword in TypeScript

**keyof is a keyword which  return all keys union from an object or object type data.**

Lets show an example.

`type Developer = {`

`category: string;`

`technologies: string[];`

`}`

`type FullStackDeveloper = {`

`[K in keyof Developer] = Developer[k];`

`}`

*Here in this example we define FullStack Developer which key will be Developer keys and it values data type will be Developer's value data type.*

## Type inference in TypeScript and its necessity

**Type inference in typescript is the compiler ability to automatically determine variable, parameter or return value.**

Let's show an example:

`var value = 10;`

`value = "hello world"; // error: type string is not assignable to type number`

*Type Inference is helpful for these reasons:*

1.  Improve readability
2.  Intelligent suggestion
3. Early error detection

## TypeScript help in improving code quality and project maintainability

***Describing how TypeScript help in improving code quality and project maintainability ..***

1. Early error detection: TypeScript can detect error before run code.
2.  Intelligent code compilation and editor support:
    - Autocomplete
    - Realtime type checking
    - Inline documentation
3.  Better refactoring support
4. Self documenting code: Types acts as documentation
5. Scalability for large project: Large project with TypeScript will be more scalable