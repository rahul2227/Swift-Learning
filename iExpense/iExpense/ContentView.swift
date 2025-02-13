//
//  ContentView.swift
//  iExpense
//
//  Created by Rahul Sharma on 10/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var expenses = Expenses()
    
    @State var showAddItemView: Bool = false
    @State var showAddBudgetView: Bool = false // The add expense view can be reused to add budget as well
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(expenses: expenses)
                List {
                    
                    ForEach(expenses.items) { item in
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
                        .listRowBackground(getLisBackgroundColor(for: item.amount).opacity(0.5))
                    }
                    .onDelete(perform: deleteItems)
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
    
    func deleteItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
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
