//
//  ContentView.swift
//  iExpense
//
//  Created by Rahul Sharma on 10/02/25.
//

import SwiftUI

struct ListItemView: View {
    
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(ColorPallete.white.value)
                Text(item.type)
                    .foregroundStyle(ColorPallete.platinum.value)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                .foregroundStyle(ColorPallete.white.value)
        }
    }
}

struct ContentView: View {
    
    @State var expenses = Expenses()
    
    @State var showAddItemView: Bool = false
    @State var showAddBudgetView: Bool = false // The add expense view can be reused to add budget as well
    
    var personalItems: [ExpenseItem] {
        expenses.items.filter{$0.type == "Personal"}
    }
    
    var businessItems: [ExpenseItem] {
        expenses.items.filter{$0.type == "Business"}
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(expenses: expenses)
                List {
                    
                    Section("Personal Expenses") {
                        ForEach(personalItems) { item in
                            ListItemView(item: item)
                                .listRowBackground(getLisBackgroundColor(for: item.amount).opacity(0.5))
                        }
                        .onDelete(perform: expenses.removeItems)
                    }
                    
                    Section("Business Expenses") {
                        ForEach(businessItems) { item in
                            ListItemView(item: item)
                                .listRowBackground(getLisBackgroundColor(for: item.amount).opacity(0.5))
                        }
                        .onDelete (perform: expenses.removeItems)
                    }
                    
                    
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // This is the button for adding budget
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Budget") {
                        showAddBudgetView = true
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("John")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Item", systemImage: "plus") {
                        showAddItemView = true
                    }
                }
            }
            .sheet(isPresented: $showAddItemView, content: { AddExpense(expenses: expenses, isBudgetMode: false)
            })
            .sheet(isPresented: $showAddBudgetView, content: {
                AddExpense(expenses: expenses, isBudgetMode: true)
            })
        }.preferredColorScheme(.dark)
    }
    
    func getLisBackgroundColor(for amount: Double) -> Color {
        if amount <= 10 {
            return .green
        } else if amount <= 100 {
            return .yellow
        }else {
            return .red
        }
    }
}

#Preview {
    ContentView()
}
