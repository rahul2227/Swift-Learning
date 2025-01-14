import Cocoa

// MARK: Protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}


func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


let car = Car()
commute(distance: 100, using: car)


let bike = Bicycle()
commute(distance: 50, using: bike)


getTravelEstimates(using: [car, bike], distance: 150)

// MARK: Using Opaque return types

//This help us reduce complexity in our code

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// MARK: Extensions and protocol extensions
// Let us add functionality to any type, be it defined by us or by swft
//extension Array {
//    var isNotEmpty: Bool {
//        isEmpty == false
//    }
//}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}


let guests = ["Mario", "Luigi", "Peach"]


if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

//  Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hello, I'm \(name)!")
    }
}

struct Employee: Person {
    let name: String
}

let employee = Employee(name: "John")
employee.sayHello()

let protocolsSummary: String = """

- Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
- Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
- Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
- Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.

"""
