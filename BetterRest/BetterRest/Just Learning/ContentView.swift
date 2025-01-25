//
//  ContentView.swift
//  BetterRest
//
//  Created by Rahul Sharma on 22/01/25.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    HStack( spacing: 0) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        
                        Spacer()
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    Section("Desired amount of sleep"){
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    
                    Section ("Daily Coffee Intake") {
                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    }
                }
                .frame(maxHeight: 300)
                
                Spacer()
                
                Button {
                    calculateBedtime()
                } label: {
                    Text("Calculate")
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.black)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(25)
                }
                Spacer()
                Spacer()
                
            }.background(Color.gray.opacity(0.1))
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let cofing = MLModelConfiguration()
            let model = try SleepCalculator(configuration: cofing)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
