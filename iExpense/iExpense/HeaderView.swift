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
    
    var totalAmount: Double {
        return expenses.totalAmount()
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("\(currentMonth)")
                .font(.headline)
                .foregroundStyle(.white)
            Text("\(totalAmount.formatted(.currency(code: Locale.current.currency?.identifier ?? "EUR")))")
                .font(.title.bold())
                .foregroundStyle(.white)
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                Text("Great! You saved this much in this month")
            }.foregroundStyle(.white)
        }
        .padding()
        .background(.purple.gradient)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    HeaderView(expenses: Expenses())
}
