import Cocoa

// MARK: Functions

func buyCarNoReturn(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        print("We don't have car for this price range")
    }
}

buyCarNoReturn(price: 40000)

// returning function

func buyCar(price: Int) -> String {
    let decision: String?
    switch price {
    case 0...20_000:
        decision = "This seems cheap."
    case 20_001...50_000:
        decision = "This seems like a reasonable car."
    case 50_001...100_000:
        decision = "This had better be a good car."
    default:
        decision = "We don't have car for this price range"
    }
    return decision ?? "Something Went Wrong"
}

let decision = buyCar(price: 40000)
print(decision)


// string contain the same letters

func containsSameLetters(string1: String, string2: String) -> Bool {
    // One approach
    let stringSet1 = Set<Character>(string1.lowercased())
    let stringSet2 = Set<Character>(string2.lowercased())
    
//    return stringSet1 == stringSet2 ? true : false
    
    // second approach
    return string1.lowercased().sorted() == string2.lowercased().sorted()
}

print(containsSameLetters(string1: "Rahul", string2: "sharma"))

func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.lowercased().sorted() == string2.lowercased().sorted()
}

print(areLettersIdentical(string1: "american", string2: "dream"))

// pythagorus function

func pythagorus(height a: Double, base b: Double) -> Double {
    sqrt((a * a) + (b * b))
}

print(pythagorus(height: 3, base: 4))

// Tuples

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

func getUser2() -> (firstName: String, lastName:String){
    ("Rahul", "Sharma")
}

func getUser3() -> (String, String){
    ("German", "Cities")
}

let user = getUser()
let user2 = getUser2()
let user3 = getUser3()
print("Name: \(user.firstName) \(user.lastName)")
print("Name: \(user2.firstName) \(user2.lastName)")
print("Name: \(user3.0) \(user3.1)")

// destructering

var (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")
(firstName, _) = getUser2()
print("Name: \(firstName)")
