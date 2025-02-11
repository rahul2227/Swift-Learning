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
    
    var expenses: Expenses
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                
                TextField("Enter amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(Text("Add Expense"))
            .toolbar {
                Button ("Save") {
                    expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddExpense(expenses: Expenses())
}
