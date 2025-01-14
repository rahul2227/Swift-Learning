import Cocoa


struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int {
        didSet {
            print("Gear changed to \(currentGear)")
        }
    }
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    mutating func chanegeGear(to newGear: Int) -> String {
        if newGear >= 1 && newGear <= 10 {
            currentGear = newGear
            return "Gear change successful"
        } else {
            return "This is not an aircraft!"
        }
    }
}

var honda = Car(model: "Honda", numberOfSeats: 4, currentGear: 1)
print(honda.currentGear)
honda.chanegeGear(to: 5)
print(honda.currentGear)
