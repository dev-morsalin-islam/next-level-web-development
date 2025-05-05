{

    class Animal{
        hand: number ;
        leg: number ;

        constructor(hand: number, leg: number){
            this.leg = leg;
            this.hand = hand;
        }
    }


    const oxx = new Animal(0,4);
    console.log(oxx.leg);


}