import Cocoa

// MARK: Loops

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for platform in platforms { //Items in iterable loop
    print("Swift works great on \(platform)")
}

for i in 1...12 { // Through loop
    print("5 x \(i) is \(5 * i)")
}

for i in 1..<12 { // Upto loop
    print("5 x \(i) is \(5 * i)")
}

var lyrics = "Haters gonna"

for _ in 1...5 { // loop with no use of the loop index variable
    lyrics += " hate"
}

print(lyrics)

// While loop
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off")

let id = Int.random(in: 1...1000)
print("The random number is \(id)")

let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 { // very useful for custom conditions
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

// rolling 10 dice and automatically roll the next dice if previous one had the same results

var rolls = 10
var firstRoll, currentRoll, anotherDiceRoll: Int?
for roll in 1...rolls {
    print("Current roll is \(roll)")
    if roll == 1 {
        firstRoll = Int.random(in: 1...6)
        print("This is the first roll: \(firstRoll!)")
    } else {
        currentRoll = Int.random(in: 1...6)
        print("Rolled \(currentRoll!)")
        if currentRoll == firstRoll {
            anotherDiceRoll = Int.random(in: 1...6)
            print("Another Dice roll is \(anotherDiceRoll!)")
        }
    }
}
print("############## While Loop Testing")
rolls = 10
while rolls > 0 {
    print("Current roll is \(rolls)")
    if rolls == 10 {
        firstRoll = Int.random(in: 1...6)
        print("This is the first roll: \(firstRoll!)")
    } else {
        currentRoll = Int.random(in: 1...6)
        print("Rolled \(currentRoll!)")
        if currentRoll == firstRoll {
            anotherDiceRoll = Int.random(in: 1...6)
            print("Another Dice roll is \(anotherDiceRoll!)")
        }
    }
    rolls -= 1
}

var cats: Int = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("Enough cats!")
        cats = 10
    }
}

// labelled statements
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

var people = 2
while people < 10 {
    people += 2
    if people == 10 {
        print("We got 10 people.")
    }
}
