import Cocoa

// MARK: Variables and Constants
// variable handling
// changing values with the variable is possible!
var name = "Ted"
name = "Rebecca"
name = "Keeley"

// Let (Constants)
// Swift like these as they are well behaved and doesn't let you accidentaly mess up by changing values
let actorName = "Tom Cruise"
//actorName = "Brad Pitt" // Will not be possible!

// Printing values
print(name)

// MARK: Strings and String Manipulation
let actorNameWithQuotes = "\"\(actorName)\""
print(actorNameWithQuotes)
let anotherActorName = "Salman Khan"

// How to use Quotes inside a string is by using Backslash "\"
let quoteInsideString = "Then he tapped a sign saying \"Believe\" and walked away."
print("\(actorNameWithQuotes) looked at \(anotherActorName) nervously and \(quoteInsideString).")

// Multiline Strings
let multilineString = """
A day in
the life of 
An International Student.
""" // important part of this is that the last three quotes should be in a new line
// for swift to recognise a multiline string

// Functionalities of Strings
print(actorName.count)
// This can also be done while using a variable
let actorNameLength = actorName.count
print(actorNameLength)

// Upper and LowerCase
let lowerCaseName = actorName.lowercased()
let upperCaseName = actorName.uppercased()
print(lowerCaseName)
print(upperCaseName)

// prefix and suffix
let prefixName = actorName.hasPrefix("Tom")
let suffixName = actorName.hasSuffix("cruise") //This will be falas as these functions are
// case sensitive
print(prefixName)
print(suffixName)

// MARK: Whole Numbers
let age = 25
let reallyBigNumber = 100000000
let reallyBigUnderstandingNumber = 100_000_000
// Swift ignores the underscores in between the numbers making it easier for us to interpret
// these numbers while writing code
// allowing for absurdities like this
let reallyBigAbsurdLookingNumber = 1_00__00___00____00

// Integer have shorthand functionalities for assigning values as well to the same
// variables (Ofc only working on variables and not constant because we are changing values)

var counter = 10
counter += 1 // instead of counter = counter + 1
print(counter)

// Similar operations
counter -= 1
counter *= 2
counter /= 4
counter %= 5 // to calculate remainder

// We can also find multiples
let numberOfStars = 550
print(numberOfStars.isMultiple(of: 5))

// or this can be done directly on the number itself
print(550.isMultiple(of: 6))

// MARK: Decimal Numbers
let a = 1
let b = 2.0
//let c = a + b // won't be possible because swift doesn't allow us to recklessly
// mix two types of variables or constants

// This can be changed by using explicit type conversion
let c = a + Int(b)
// OR
let d = Double(a) + b
print(c)
print(d)

// Combined with type safety, this means that once Swift has decided what data type a
// constant or variable holds, it must always hold that same data type.
var anotherName = "Nicolas Cage"
anotherName = "John Travolta"
//anotherName = 57 // not possible!
// decimal numbers have the same range of operators and compound assignment operators as
// integers

var rating = 5.0
rating *= 2
// Many older APIs use a slightly different way of storing decimal numbers, called CGFloat.
// Fortunately, Swift lets us use regular Double numbers everywhere a CGFloat is expected,
// so although you will see CGFloat appear from time to time you can just ignore it.


// MARK: Day 2
// Booleans
//let goodMorning = true
let stopLearning = false
let isMulripleOfThree = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = true // flipping the value of a boolean
print(isAuthenticated)

// we also have toglle in booleans
var goodMorning: Bool = false
goodMorning.toggle() // same as using not operators(!)
print(goodMorning)

// MARK: String Concatenation and interpolation

let firstName = "Nicolas"
let lastName = "Cage"
let fullName = firstName + " " + lastName
let fullName2 = "\(firstName) \(lastName)"
print(fullName)
print(fullName2)

// OR something like this
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action // operator overloading
// for strings: string + string = concatenation
// Don't do it too much!!

let luggageCode = "1" + "2" + "3" + "4" + "5"
//Swift can’t join all those strings in one go. Instead, it will join the first two to make
// “12”, then join “12” and “3” to make “123”, then join “123” and “4” to make “1234”, and
//finally join “1234” and “5” to make “12345” – it makes temporary strings to hold “12”,
//“123”, and “1234” even though they aren’t ultimately used when the code finishes.

// BETTER OPTION IS STRING INTERPOLATION
//let name = "Taylor"
//let age = 25
let message = "Hellow, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
//let missionMessage = "Apollo " + number + " landed on the moon."

// But it can be done like this
var missionMessage = "Apollo " + String(number) + " landed on the moon."

// However, efficient way is this
missionMessage = "Apollo \(number) landed on the moon."

// We can also put messages inside our string interpolation:
print("5 x 5 = \(5 * 5)")
