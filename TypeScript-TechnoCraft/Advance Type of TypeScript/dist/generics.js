"use strict";
{
    // this will support dynamic type
    const genericsNumberArray = [10, 20, 30];
    const genericsStringArray = ["lorem", "ipsum", "dolar"];
    const students = [
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
    ];
    const contactAddress = [
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
    ];
    // now access this array of touple
    console.log(contactAddress[0][0]);
}
