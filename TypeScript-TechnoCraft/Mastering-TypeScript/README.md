Difference between interface and type are given bellow

Interface:
    i) Interface is used to define custom data type, it describe the shape of an object.
    ii) Class can directly inherit interface by using implements keyword.
    iii) There is use a curly braces {} to define interface structure.

    

Type:
    i) Type alias is used to define custom data type. It can represent object shape, union, primitive etc.
    ii) Class can not extends a type but class can implement type.
    iii) To define a type there is use a assignment operator ("=")


What is the use of the keyof keyword in TypeScript? 

Keyword is a keyword which  return all keys union from an object or object type data.
Lets show an example.
type Developer = {
    category: string;
    technologies: string[];
}

type FullStackDeveloper = {
    [K in keyof Developer] = Developer[k];
}
here in this example we define FullStack Developer which key will be Developer keys and it values data type will be Developer's value data type.



