"use strict";
// function with generics
{
    const createArrayWithGenerics = (paramList) => {
        return paramList;
    };
    const genericsNumberArray = createArrayWithGenerics([10, 20, 30, 40]);
    // console.log(genericsNumberArray);
    const genericsStringArray = createArrayWithGenerics(["hello", "world"]);
    const appUsers = [
        {
            name: "lorem",
            id: 123
        },
        {
            name: "ipsum",
            id: 455
        }
    ];
    const genericsObjectArray = createArrayWithGenerics(appUsers);
    const webAppUsers = [
        ["Lorem", 123],
        ["Ipsum", 456]
    ];
    const genericsToupleArray = createArrayWithGenerics(webAppUsers);
    console.log(genericsToupleArray);
}
