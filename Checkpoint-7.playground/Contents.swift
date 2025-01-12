import Cocoa

class Animal {
    var legs: Int = 0 {
        didSet
        {
            print("Animal has \(legs) legs")
        }
    }
//    init(){}
//    init(legs: Int) {
//        self.legs = legs
//        print("Animal has \(legs) legs")
//    }
}


class Dog: Animal {
     init(legs: Int) {
         super.init()
         super.legs = legs
    }
    func speak() {
        print("Woof!")
    }
}

class Corgi: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
        print("Corgi has \(super.legs) legs")
    }
    override func speak() {
        print("Corgi says Woof woof!")
    }
}

class Poodle: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
        print("Poodle has \(super.legs) legs")
    }
    override func speak() {
        print("Poodle says Woof woof Woof!")
    }
}


class Cat: Animal {
    init(legs: Int) {
        super.init()
        super.legs = legs
   }
    func speak() {
        print("Meaow!")
    }
}

class Persian: Cat {
    override init(legs: Int) {
        super.init(legs: legs)
        print("Persian has \(super.legs) legs")
    }
    override func speak() {
        print("Persian says Persian MEOW!")
    }
}

class Lion: Cat {
    override init(legs: Int) {
        super.init(legs: legs)
        print("Lion has \(super.legs) legs")
    }
    override func speak() {
        print("Lion ROARS!")
    }
}

let dog = Dog(legs: 4)
dog.speak()
let corgi = Corgi(legs: 4)
corgi.speak()
let poodle = Poodle(legs: 4)
poodle.speak()
let cat = Cat(legs: 4)
cat.speak()
let persian = Persian(legs: 4)
persian.speak()
let lion = Lion(legs: 4)
lion.speak()
