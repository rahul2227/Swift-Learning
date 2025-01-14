import Cocoa

// MARK: Functions: Default Values and so on

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}


printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

enum PassWordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {throw PassWordError.short}
    if password == "12345" {throw PassWordError.obvious}
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


let password = ""

do {
    let result = try checkPassword(password)
    print("Result: \(result)")
}
//catch PassWordError.short{
//    print("Please choose a longer password")
//} catch PassWordError.obvious {
//    print("Mu luggage has the same combination!")
//}
catch {
    print("There was an error: \(error.localizedDescription)")
}
