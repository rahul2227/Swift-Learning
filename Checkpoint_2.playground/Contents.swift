import Cocoa

// Task is to create an array of Strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let movieActors: [String] = [
    "Tom Hanks",
    "Brad Pitt",
    "Tom Cruise",
    "Tom Hanks",
    "Brad Pitt",
    "Samuel L. Jackson",
    "Salma Hayek",
    "Salman khan",
    "Shahrukh khan",
    "Aishwarya Rai",
    "Hritik Roshan",
    "Salman Rushid"
]

print("We have invited \(movieActors.count) actors from all over the world for this party")

let uniqueActors = Set(movieActors)
print("There are \(uniqueActors.count) unique actors")

print("Don't forget and read through all of the names as \(movieActors.count - uniqueActors.count) share the same name")
