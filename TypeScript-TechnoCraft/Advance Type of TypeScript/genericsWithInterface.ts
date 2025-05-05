
// generics + interface




interface Developer <T, D extends {designation: string}>{
    type: string
    technology: T,
    designation: D["designation"]
    
}


const frontEndTechnology : string [] = ["html", "css", "js", "tailwindcss", "react.js", "next.js", ]

type Data = {
    designation: "front-end" | "backend" | "full stack"
}


const frontEndDev: Developer<string [],Data> = {
    type: "Front End",
    technology: frontEndTechnology,
    designation: "full stack"    // designation must be "front end" or "back end" or "full stack" because we receive Data as parametter, in "Data" type we make restriction its data

}





interface Creature <T>{
    hasLife: boolean,
    category: "animal" | "plant" | "non bilogical"

    charecteristics: T
}

type Charecteristics <T> = { movement: boolean } & T;

interface Plant extends Creature<Charecteristics<{
    autoTropic: boolean, // make its own food 
    makeOxygen: boolean

}>> {
   reproductiveSystem: string
}


const BananaTree : Plant = {
    reproductiveSystem: "asexual",
    hasLife: true,
    category: "plant",
    charecteristics:{
        movement: true,
        autoTropic: true,
        makeOxygen: true,


    },
}


console.log(BananaTree);