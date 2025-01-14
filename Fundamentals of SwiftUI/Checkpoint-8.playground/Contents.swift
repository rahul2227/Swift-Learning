import Cocoa

protocol Building {
    var numberOfRooms: Int { get }
    var costOfBuilding: Int {get set}
    var agentName: String { get set}
    var costOfRoom: Int {get set}
    func printSalesSummary(for buyee: String)
}

extension Building {
    func printSalesSummary(for buyee: String) {
        print("\(agentName) sold \(numberOfRooms) rooms for \(costOfRoom)/room to \(buyee).")
    }
}

struct House: Building {
    var numberOfRooms: Int
    var costOfBuilding: Int
    var agentName: String
    var costOfRoom: Int
    var listOfResidents: [String]
}

struct Office: Building {
    var numberOfRooms: Int
    var costOfBuilding: Int
    var agentName: String
    var costOfRoom: Int
    var nameOfCompany: String
}

let sharedHouse = House(numberOfRooms: 3, costOfBuilding: 100_00_000, agentName: "John", costOfRoom: 50_000, listOfResidents: ["Taylot", "Jane", "Arun"])

let office = Office(numberOfRooms: 5, costOfBuilding: 200_00_000, agentName: "Rahu", costOfRoom: 100_000, nameOfCompany: "Ameri\"Can\"-Apple")

sharedHouse.printSalesSummary(for: sharedHouse.listOfResidents[0])
office.printSalesSummary(for: office.nameOfCompany)
