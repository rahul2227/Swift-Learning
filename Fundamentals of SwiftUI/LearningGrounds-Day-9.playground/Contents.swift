import Cocoa

// MARK: Closures

let sayHello: () -> String = {
    return "Hello, World!"
}

// OR
let sayHellof = { (name: String) -> String in
    "Hi \(name)!"
} // Anonymous function and stacking them in variables

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData

let user = data(1989)
print(user)


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)

// MARK: Trailing Closure and shorthand

let actors = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sortActors = actors.sorted{ a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }

    return a < b
}
print(sortActors)

let sortActorswithDollars = actors.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
print(sortActorswithDollars)


let reverseSortActors = actors.sorted { $0 > $1 }
let reverseSortteam = team.sorted(by: >)
print(reverseSortActors)
print(reverseSortteam)

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)


// MARK: Accepting Functions as parameters

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var  numbers: [Int] = []
    for _ in 0..<size {
//        numbes.append(generator()) // This is a shorthand
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
