//
//  Data.swift
//  iExpense
//
//  Created by Rahul Sharma on 11/02/25.
//

import Foundation
import Observation
import SwiftUI

struct ExpenseItem : Identifiable, Codable { // By conforming to this we can also skip the id part in for each inside list or wherever we need to identify expenses uniquely
    var id = UUID() // Basically by conforming to Identifiable we are guaranteeing that our Expense Item is Uniquely identifiable
    let name: String
    let type: String
    let amount: Double
}

struct BudgetItem : Identifiable, Codable {
    var id = UUID()
    let month: String
    let amount: Double
}

enum ColorPallete {
    
    case black, blue, orange, platinum, white
}

extension ColorPallete: ShapeStyle {
    
    var value: Color {
        get {
            switch self {
            case .black:
                return Color(red: 0/255, green: 0/255, blue: 0/255)
            case .blue:
                return Color(red: 20/255, green: 33/255, blue: 61/255)
            case .orange:
                return Color(red: 252/255, green: 163/255, blue: 17/255)
            case .platinum:
                return Color(red: 229/255, green: 229/255, blue: 229/255)
            case .white:
                return Color(red: 255/255, green: 255/255, blue: 255/255)
            }
        }
    }
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
    
    var monthlyBudgets = [BudgetItem]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(monthlyBudgets) {
                UserDefaults.standard.set(encodedData, forKey: "Budgets")
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
        
        if let savedBudgets = UserDefaults.standard.data(forKey: "Budgets") {
            if let decodedBudgets = try? JSONDecoder().decode([BudgetItem].self, from: savedBudgets) {
                monthlyBudgets = decodedBudgets
                return
            }
        }
        
        items = []
        monthlyBudgets = []
    }
    
    func totalAmount() -> Double {
        return items.reduce(0) { $0 + $1.amount }
    }
    
    func budgetForMonth(_ month: String) -> Double {
        return monthlyBudgets.first(where: { $0.month == month })?.amount ?? 0
    }
}
