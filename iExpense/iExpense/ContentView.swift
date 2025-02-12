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
                                Text(item.type)
                                    .foregroundStyle(.blue)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .listRowBackground(Color.green.opacity(0.4))
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                // This is the button for adding budget
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Budget") {
//                        showAddItemView = true
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
            .sheet(isPresented: $showAddItemView, content: { AddExpense(expenses: expenses)
            })
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
