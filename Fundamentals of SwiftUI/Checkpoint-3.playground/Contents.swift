import Cocoa

for i in 1...100 {
    if (i.isMultiple(of: 3) && i.isMultiple(of: 5)) {
        print("FizzBuzz")
    } else if (i.isMultiple(of: 5)) {
        print("Buzz")
    } else if (i.isMultiple(of: 3)) {
        print("Fizz")
    } else {
        print(i)
    }
}

for i in 1...100 {
    // Build "Fizz" if divisible by 3 and "Buzz" if divisible by 5
    let output = (i % 3 == 0 ? "Fizz" : "") + (i % 5 == 0 ? "Buzz" : "")
    // If output is empty (not divisible by 3 or 5), print the number
    print(output.isEmpty ? i : output)
}
