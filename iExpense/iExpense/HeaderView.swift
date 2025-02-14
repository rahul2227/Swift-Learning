//
//  HeaderView.swift
//  iExpense
//
//  Created by Rahul Sharma on 12/02/25.
//

import SwiftUI

struct HeaderView: View {
    
    var expenses: Expenses
    
    var currentMonth: String {
        let monthInt = Calendar.current.component(.month, from: Date())
        let monthStr = Calendar.current.monthSymbols[monthInt-1]
        return monthStr
    }
    
    
    var savedBudgetForMonth: Double {
        let monthBudget = expenses.budgetForMonth(currentMonth)
        
        return monthBudget - totalAmount
    }
    
    var totalAmount: Double {
        return expenses.totalAmount()
    }
    
    var backgroundColor: Color {
        ColorPallete.orange.value
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("\(currentMonth) : \(expenses.budgetForMonth(currentMonth).formatted())")
                .font(.headline)
                .foregroundStyle(.white)
            Text("Spent: \(totalAmount.formatted(.currency(code: Locale.current.currency?.identifier ?? "EUR")))")
                .font(.title.bold())
                .foregroundStyle(.white)
            HStack {
                if savedBudgetForMonth > 0 {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Great! This month you saved \(Locale.current.currencySymbol ?? "$") \(savedBudgetForMonth.formatted())")
                } else {
                    Image(systemName: "hand.thumbsdown.fill")
                    Text("Woah! This month you spent \(Locale.current.currencySymbol ?? "$") \(abs(savedBudgetForMonth).formatted()) more")
                }
            }.foregroundStyle(.white)
        }
        .padding()
        .background(backgroundColor.opacity(0.9))
        .clipShape(.rect(cornerRadius: 20))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HeaderView(expenses: Expenses())
}
