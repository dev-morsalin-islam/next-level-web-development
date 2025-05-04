



{

    /*  array declare new format */
    // const array : Array<number> = [10, 20];
    // console.log(array);

    type myGenericsArray<T> =  Array<T>


    // this will support dynamic type
    const genericsNumberArray : myGenericsArray<number> = [10, 20, 30]
    const genericsStringArray: myGenericsArray<string> = ["lorem", "ipsum", "dolar"];
    


    // generics will accept interface, type and other type

    // lets see an example


    interface Student{
        name: string,
        roll: number,
        email: string
    
    }



    const students: myGenericsArray<Student> = [
        {
            name: "Morsalin Islam",
            roll: 635675,
            email: "dev.morsalin@gmail.com"
        },

        {
            name: "Motiur Rahman",
            roll: 1234,
            email: "motiur@gmail.com",
        }
    ]


    // n o w make generics touple


    type ContactAddress   = [name:string, email: string, phone: string]

    const contactAddress : myGenericsArray<ContactAddress> = [
        [
           "Morsalin",
           "dev.morsalin@gmail.com",
           "013xxx"
        ],

        [
            "Motiur",
            "dev.motiur",
            "0134xxx",
        ]
    ]


    // now access this array of touple

    console.log(contactAddress[0][0]);



}