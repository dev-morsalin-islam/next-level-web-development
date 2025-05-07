"use strict";
{
    class Animal {
        constructor(name, leg, hand, sound) {
            this.name = name;
            this.leg = leg;
            this.hand = hand;
            this.sound = sound;
        }
        playSound() {
            return `${this.name} make ${this.sound} sound`;
        }
    }
    class Cat extends Animal {
        constructor(name, leg, hand, sound, isPet) {
            super(name, leg, hand, sound); // pass it to its parent
            this.name = name;
            this.leg = leg;
            this.hand = hand;
            this.sound = sound;
            this.isPet = isPet;
        }
    }
    const myCat = new Cat("Tom", 4, 0, "Meaw Meaw", true);
    console.log(`Cat have ${myCat.leg} legs`);
    console.log(`${myCat.playSound()}`);
}
