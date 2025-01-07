import Cocoa

// MARK: Type Annotations

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

// When do you want to use Type Inference?
// Preference is to use everytime, apart from the constants and variables that don't have a value yet

let username: String
// lots of code
username = "John"

print(username)
// Golden Rule: Swift must know at everytime the datatypes of variables and constants

let Summary = """

- Arrays store many values, and read the using indices
    - Arrays must always be specialized so they contain one specific type, and they have helpful functionality such as count, append(), and contains().
- Dictionaries stire many values, and read them keys that we specify.
    - They must be specialized to have one specific type for key and another for the value, and have similar functionality to arrays, such as contains() and count.
- Sets stores many values, but we don't choose their orders.
    - Sets are really efficient at finding whether they contain a specific item.
- Enums create our own types to specify a range of acceptable value.
- Swift uses type inference to use type annotations to force a particular type.
    - Swift must always know the type of data inside a constant or variable, and mostly uses type inference to figure that out based on the data we assign. However, it’s also possible to use type annotation to force a particular type.
"""
