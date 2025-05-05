


// function with generics


{

    const createArrayWithGenerics = <T>(paramList: T[]): T[] =>{
        return paramList
    }


    const genericsNumberArray: number [] = createArrayWithGenerics<number>([10, 20, 30, 40]);
    // console.log(genericsNumberArray);


    const genericsStringArray: string [] = createArrayWithGenerics<string>(["hello", "world"]);

    // now make object type to work with generic object array

    type user={
        name: string, 
        id: number,
    }

    const appUsers =[
        {
            name: "lorem",
            id: 123
        },
        {
            name: "ipsum",
            id: 455
        }
    ]

    const genericsObjectArray: user[] = createArrayWithGenerics<user>(appUsers);

    // console.log(genericsObjectArray);


    type userWithId = [userName: string, id: number]

    const webAppUsers: userWithId[] =[
        ["Lorem", 123],
        ["Ipsum", 456]
    ]


    const genericsToupleArray: userWithId[] = createArrayWithGenerics<userWithId>(webAppUsers);

    console.log(genericsToupleArray);


}