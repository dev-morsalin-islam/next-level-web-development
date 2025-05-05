"use strict";
// generics + interface
const frontEndTechnology = ["html", "css", "js", "tailwindcss", "react.js", "next.js",];
const frontEndDev = {
    type: "Front End",
    technology: frontEndTechnology,
    designation: "full stack" // designation must be "front end" or "back end" or "full stack" because we receive Data as parametter, in "Data" type we make restriction its data
};
const BananaTree = {
    reproductiveSystem: "asexual",
    hasLife: true,
    category: "plant",
    charecteristics: {
        movement: true,
        autoTropic: true,
        makeOxygen: true,
    },
};
console.log(BananaTree);
