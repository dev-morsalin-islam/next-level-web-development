"use strict";
{
    class Vehicle {
        constructor(name) {
            this.name = name;
        }
        move() {
            console.log(`${this.name} can move`);
        }
    }
    class Plan extends Vehicle {
        constructor(name) {
            super(name);
        }
        move() {
            console.log(`${this.name} can fly`);
        }
    }
    const myCar = new Vehicle("BMW");
    myCar.move();
    const myPlan = new Plan("XyZ");
    myPlan.move();
}
