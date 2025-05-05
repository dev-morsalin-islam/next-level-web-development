"use strict";
{
    class Animal {
        constructor(hand, leg) {
            this.leg = leg;
            this.hand = hand;
        }
    }
    const oxx = new Animal(0, 4);
    // console.log(oxx.leg);
    class Plant {
        constructor(name, isGivenFruit) {
            this.name = name;
            this.isGivenFruit = isGivenFruit;
        }
    }
    const mangoPlant = new Plant("Mango", true);
    console.log(mangoPlant);
}
