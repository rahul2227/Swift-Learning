import Cocoa

// Structs
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    // by adding the mutating keyword we make this function chaging
    // the meaning behind this is that the function can change the values
    // inside it and inturn the values stored inside the struct
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// Another fact is that if a struct has a mutating function or property inside it then
// we can not initialize it to a let constant, because swift knows that eventually the value
// of that will change so it can't be a constant
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

struct Employee1 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            // this is a getter code
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer1 = Employee1(name: "Sterling Archer", vacationAllocated: 14)

archer1.vacationTaken += 4
print(archer1.vacationRemaining)
archer1.vacationRemaining = 7
print(archer1.vacationAllocated)

// taking action when the property of a struct changes

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// Creating a custom initializer

struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R", number: 15)
print(player)
let player1 = Player(name: "Rahul")
print(player1)


// Steps to retaining the member-wise initialiser of swift
// is to move our custom initializer to an extension

struct EmployeeRetain {
    var name: String
    var yearsActive = 0
}

extension EmployeeRetain {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = EmployeeRetain(name: "Laura Roslin")
print(roslin)
// as does creating an anonymous employee
let anon = EmployeeRetain()
print(anon)
