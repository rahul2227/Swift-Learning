import Cocoa

// MARK: Access control
// private: Don'e let anything outside the struct use this
// fileprivate Don't let anything outside the current file use this.
// public Let anyone, anywhere use this
// private(set): let anyone read this property, but only let my methods write it.
// If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.

struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//account.funds -= 1000 // This will not be allowed as you're trying to change a value private to struct BankAccount outside of the struct

// MARK: static properties and methods

struct School {
    nonisolated(unsafe) static var studentCount = 0
    
    static func add(student: String){
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "John")
print(School.studentCount)
 
