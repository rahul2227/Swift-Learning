import Cocoa

// MARK: Day 12: Classes

let differenceBetweenStructsAndClasses = """
Similarities:
- You get to create and name them.
- Add properties, methods, property observers, and access control.
- create custom initializers to configure new instances.
Differences(5):
- You can make one class build upon funcitonality in another class.
- Swift won't generate a memberwise initializer for classes.
- If you copy an istance of a class, both copies share the same data.
- We can add a deinitializer to run when the funal copy is destroyed.
Constant class instances can have their variable properties changed. 
"""

let importantDifferencesBetweenStructsAndClasses = """
- Classes do not come with synthesized memberwise initializers.
- One class can be built upon (“inherit from”) another class, gaining its properties and methods.
- Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
- Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
- Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.   
"""

class Game {
    var score: Int = 0{
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score = 100


// MARK: Inheritance

class Employee{
    let hours: Int
    
    init(hours: Int){
        self.hours = hours
    }
    func printSummary(){
        print("I work \(hours) a day")
    }
}

class Developer: Employee{
    func work(){
        print("I'm writing code for \(hours) hours")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee{
    func work(){
        print("I'm Going to meetings for \(hours) hours")
    }
}


let robert = Developer(hours: 10)
let john = Manager(hours: 20)
robert.work()
john.work()

let novall = Developer(hours: 8)
novall.printSummary   ()

// So let's say we want a little different behaviour in our child class inside
// the method inhereted from the parent class, then swift implements a simple rule.
// then we must use the override keyword in the child class version, what it does is that you
// can't change a function in child class without overrice and second thing is if you use
// override in a child class without actually changing anything that is also not valid

// you can make a class final and then it will become non-inheritable from others


// MARK: class initializers

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(is isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}


let teslaX = Car(is: true, isConvertible: false)

// If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.

// MARK: Deinitilizer in classes

let denitializer = """
 This comes with a few small provisos:

 - Just like initializers, you don’t use func with deinitializers – they are special.
 - Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
 - Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
 - We never call deinitializers directly; they are handled automatically by the system.
 - Structs don’t have deinitializers, because you can’t copy them.
"""


class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

// MArk: working with variables inside classes

class User1{
    var name = "Paul"
}

var user = User1()
user.name = "Taylor"
print(user.name)
user = User1()
print(user.name)
