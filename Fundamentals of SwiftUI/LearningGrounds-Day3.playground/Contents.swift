import Cocoa

// MARK: Arrays and Data
var beatles = ["John", "Paul", "George", " Ringo"]
var numbers = [1, 2, 3, 4, 5]
var temperatures = [10.0, 20.0, 30.0, 40.0, 50.0]

print(beatles[0])
print(temperatures[3])

beatles.append("Liverpool")
print(beatles)

// accessing arrays
// Arrays: They are of specific types and because of type safety they dont allow
// operations among "Different" types of arrays
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber // This means that operations can't be performed on different types of dataTypes

// explicit declaration of array
var sensibleNumbers: [Int] = [] //OR
var anotherSensibleNumbers = Array<Int>()
sensibleNumbers.append(1) // appending or adding array elements
sensibleNumbers.append(2)
sensibleNumbers.append(3)
sensibleNumbers.append(4)
sensibleNumbers.append(5)
print(sensibleNumbers)
print(sensibleNumbers.count)

// Array functionalities
var characters: [String] = ["Lana", "Kiki", "Pippa"]
print(characters.count)
characters.remove(at: 1)
print(characters.count)
print(characters)
characters.removeAll()
print(characters)

// Searching in arrays
let bondMovies: [String] = ["Casino Royale", "Quantum of Solace", "Skyfall"]
print(bondMovies.contains("Frozen"))

// Sorting an array
let cities: [String] = ["London", "Paris", "Tokyo", "New York"]
print(cities.sorted())

// Functionality of Reversing an array
let presidents: [String] = ["George Washington", "John Adams", "Thomas Jefferson"]
let reversedPresidents = presidents.reversed() // This will make another array object ReversedCollection<Array<String>>
let reversedStringPresidents: [String] = presidents.reversed() // When this explicit declaration is done, we dont get another ReversedCollection array
// Thes second one is slower because it actually reverses the array while declaring on other hand ReversedCollection just remembers that this needs to be reversed and then does it later
print(reversedPresidents)

// MARK: Dictionaries
var albums: [String: String] = [:] // OR :[String: String]()
albums["Beatles"] = "Abbey Road"
albums["Stones"] = "Sticky fingers"
albums["Rolling Stones"] = "Let it bleeds"
print(albums)
print(albums["Beatles"] ?? "No Beatles")
// Working with default values in dictionaries
print(albums["american", default: "No Beatles"])

let employees: [String : [String]]
employees = ["Sales": ["John", "Jane", "Jack"],
             "Jobs": ["Marketing", "Development", "Janitor"],
             "location": ["New York", "Tokyo", "Japan"]
]

//print(employees["Sales"]?[3] ?? "No Sales Member") // Why this is not type safe?
//print(employees["Sales", default: ["No Sales Member"]][3])

// Swift’s optional chaining (?) protects you from the case where the key doesn’t exist, but it does not automatically protect you from out-of-range indices.

//Hence people sometimes say it’s “not type safe” (or at least “not safe” at compile time) because Swift can’t ensure correctness about the array’s size purely via static type checks.

// MARK: Safe handling of index out of bounds

if let salesArray = employees["Sales"], salesArray.count > 3 {
    print(salesArray[3])
} else {
    print("No Sales Member or index out of range")
}

// OR
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// Usage:
if let name = employees["Sales"]?[safe: 3] {
    print(name)
} else {
    print("No Sales Member or index out of range")
}

// Dictionary Functionalities are same as arrays

// MARK: Sets
var actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Brad Pitt",
    "Leonardo DiCaprio",
    "Will Smith",
    "Chris Hemsworth",
])

print(actors) // set does not care the order of items

// we don't append items in set but insert them
actors.insert( "Will Smith") // wont happen because set doesn't store duplicates
actors.insert("Salman Khan")
print(actors)
// sets are optimised for fast item lookups

// MARK: ENUMS: A set of named values

enum DaysOfWeek {
    init() {
        self = .NoDay
    }
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    case NoDay
}

enum MonthsOfYear {
    case january
    case february
    case march, april // this is possible for us to declare cases after writing case once
    case may
    case June
    case july
    case august
    case september
}

var day = DaysOfWeek.monday
var day2 = DaysOfWeek() // this will be no day and is possible because of initializer
day = .friday // because the day is already of the type DaysOfWeek, then it is possible
print(day)

//var month = monthsOfYear() // Not possible because it does not have and init
var month = MonthsOfYear.january //
