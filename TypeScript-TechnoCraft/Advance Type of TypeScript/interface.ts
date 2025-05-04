{
        
    interface Student{
        name: string,
        roll: number
    }


    const student1 : Student = {
        name: "Morsalin",
        roll: 21,
        
    };


    // console.log(student1);
    // console.log(typeof student1);


    type StudentWithContact = Student & {email: string};

    const student2 : StudentWithContact = {
        name: "Morsalin Islam",
        roll: 1234,
        email: "dev.morsalin@gmail.com"
    }

    type StudentWithAge = Student | {age: number};

    const Student3 : StudentWithAge = {
        name: "Morsalin",
        roll: 123,
        age: 21 // this is optional
    }






    interface creature{
        hasLife: boolean,
        type: "plant" | "animal" | "inanimate" // this is literal type
    }


    interface animal extends creature{
        hasHand: boolean,
        totalEye: number,
        totalHand: number,
        name: string,
    }
    const cow: animal = {
        hasHand: false,
        totalEye:  2,
        totalHand: 0,
        name: "Cow",
        hasLife: true,
        type: "animal"

    }

    console.log(cow);

    type SubjectMark<subject, mark> = {
        subject: subject,
        mark : mark
    }


    interface SubjectList{
        [index: number]: string
    }

    const allSubject: SubjectList = ["C", "C++", "DSA", "Digital Electronics"];

    console.log(allSubject);

    interface Add {
        addition(num1: number,num2:number) : number
    }

    
    const add: Add = {
        addition: (num1, num2)  => num1 + num2
    }


    console.log(add.addition(10, 20));

}