//
//  Data.swift
//  iExpense
//
//  Created by Rahul Sharma on 11/02/25.
//

import Foundation
import Observation

struct ExpenseItem : Identifiable, Codable { // By conforming to this we can also skip the id part in for each inside list or wherever we need to identify expenses uniquely
    var id = UUID() // Basically by conforming to Identifiable we are guaranteeing that our Expense Item is Uniquely identifiable
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "Items")
            }
        }
    }
    
    init () {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
    func totalAmount() -> Double {
        return items.reduce(0) { $0 + $1.amount }
    }
}
