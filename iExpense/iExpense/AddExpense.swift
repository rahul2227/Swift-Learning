//
//  AddExpense.swift
//  iExpense
//
//  Created by Rahul Sharma on 11/02/25.
//

import SwiftUI

struct AddExpense: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var budgetAmount = 0.0
    @State private var monthSelection = Calendar.current.monthSymbols[Calendar.current.component(.month, from: Date())-1]
    
    var expenses: Expenses
    
    var isBudgetMode: Bool
    
    let types = ["Personal", "Business"]
    
    var months: [String] {
        return Calendar.current.monthSymbols
    }
    
    var body: some View {
        NavigationStack {
            Form {
                if !isBudgetMode{
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } else {
                    Picker("Month", selection: $monthSelection) {
                        ForEach(months, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                TextField("Amount", value: isBudgetMode ? $budgetAmount : $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Add Expense"))
            .toolbar {
                if !isBudgetMode {
                    Button ("Save") {
                        
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        
                        expenses.items.append(item)
                        
                        dismiss()
                    }
                } else {
                    Button ("Save Budget") {
                        
                        //TODO: Save budget item
                        let budgetItem = BudgetItem(month: monthSelection, amount: budgetAmount)
                        
                        expenses.monthlyBudgets.append(budgetItem)
                        
                        dismiss()
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    AddExpense(expenses: Expenses(), isBudgetMode: true)
}
