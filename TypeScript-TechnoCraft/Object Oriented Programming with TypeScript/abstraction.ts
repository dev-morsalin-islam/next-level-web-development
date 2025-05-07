{
    // we can implement abstraction by using interface and abstract class


    interface Example1{
        method1(): void;
        method2(): void;
    }

    class ClassExamPle1 implements Example1{
        method1(){
            console.log("implement  method 1")
        }
        method2(){
            console.log("implement method 2")
        }
        otherMethod(){
            console.log("this is other method");
        }
    }

    const object = new ClassExamPle1();
    object.method1();
    object.method2();
    object.otherMethod();


    // now working with  abstract class

    abstract class AbstractClass{
        abstract method1(): void;
        method2(){
            console.log("If we implement method inside abstract class there is no problem");
        }

    }

    class AbstractChildClass extends AbstractClass{
        method1(){
            console.log("this is abstract class's  method implementation");
        }

    }

    const myAbstractObject = new AbstractChildClass();
    myAbstractObject.method1();
    myAbstractObject.method2();
}