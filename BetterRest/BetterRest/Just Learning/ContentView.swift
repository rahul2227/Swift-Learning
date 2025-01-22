//
//  ContentView.swift
//  BetterRest
//
//  Created by Rahul Sharma on 22/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack{
            Stepper("\(sleepAmount.formatted()) Hours", value: $sleepAmount, in : 4...12, step: 0.25)
            DatePicker("Please Enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            DatePicker("Please Enter a 2 date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
    }
    
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        /*range*/_ = Date.now...tomorrow
    }
}

#Preview {
    ContentView()
}
