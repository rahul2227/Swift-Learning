//
//  ContentView.swift
//  StreakX
//
//  Created by Rahul Sharma on 23/02/25.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLetterOfTheWeek
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days:  [Date] = []
    let today = Date.now
    
    init() {
        UIDatePicker.appearance().backgroundColor = UIColor.init(.white.opacity(0.55))
    }
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            VStack {
                
                DatePicker("\(date.formatted(.dateTime.month(.wide)))", selection: $date, displayedComponents: [.date])
                    .foregroundStyle(.white)
                    .tint(.gray)
                    .frame(width: .infinity, height: 40)
                    
                
                HStack {
                    ForEach(daysOfWeek.indices, id: \.self) { index in
                        Text(daysOfWeek[index])
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: columns) {
                    ForEach(days, id: \.self) { day in
                        
                        if day.monthInt != date.monthInt{
                            Text("")
                        }else{
                            Text(day.formatted(.dateTime.day()))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(
                                    (day.formatted(.dateTime.day()) == today.formatted(.dateTime.day())) ? Circle()
                                        .foregroundStyle(.white.opacity(0.4))
                                    : nil
                                )
                        }
                    }
                }
            }
        }
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) {
            days = date.calendarDisplayDays
        }
    }
}

#Preview {
    CalendarView()
}
