import Cocoa

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func findSquareRoot(for number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    var rootFound = false
    for i in 1..<100 {
        if number == i * i {
            rootFound = true
            return i
        }
    }
    if !rootFound {
        throw SquareRootError.noRoot
    }
}

do {
    let squareRoot = try findSquareRoot(for: 17)
    print("Square root of 9 is \(squareRoot).")
} catch SquareRootError.outOfBounds {
    print("The number is out of bounds! Choose a different number")
} catch SquareRootError.noRoot {
    print("No root found!")
} catch {
    print("There was some error here \(error.localizedDescription)")
}
