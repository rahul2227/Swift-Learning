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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(Text("iExpense"))
            .toolbar {
                Button("Add Item", systemImage: "plus") {
                    showAddItemView = true
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
