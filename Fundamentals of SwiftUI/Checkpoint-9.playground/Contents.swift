import Cocoa

func randomIntegers(from numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}

//let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let numbers: [Int]? = nil
let randomNumber = randomIntegers(from: numbers)
print(randomNumber)
