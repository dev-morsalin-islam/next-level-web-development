


{

    class Animal{
        constructor(public name: string, public leg: number, public hand: number, public sound : string){}

        playSound(): string{
            return `${this.name} make ${this.sound} sound`;
        }
    }
    class Cat extends Animal{
        constructor(public name: string, public leg: number, public  hand: number, public sound: string, public isPet: boolean){
            super(name, leg, hand, sound); // pass it to its parent
        }
    }


    const myCat = new Cat("Tom", 4,0,"Meaw Meaw",true);

    console.log(`Cat have ${myCat.leg} legs`);
    console.log(`${myCat.playSound()}`);


}