//
//  Data.swift
//  iExpense
//
//  Created by Rahul Sharma on 11/02/25.
//

import Foundation
import Observation

struct ExpenseItem : Identifiable { // By conforming to this we can also skip the id part in for each inside list or wherever we need to identify expenses uniquely
    let id = UUID() // Basically by conforming to Identifiable we are guaranteeing that our Expense Item is Uniquely identifiable
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
