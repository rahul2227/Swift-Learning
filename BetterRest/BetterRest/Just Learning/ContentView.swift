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
    
    let paleApricot: Color = Color(red: 255/255, green: 236/255, blue: 174/255)
    let vibrantOrange: Color = Color(red: 241/255, green: 113/255, blue: 65/255)
    
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
                    Section {
                        HStack{
                            Text("When do you want to wake up?")
                                .font(.headline)
                            
                            Spacer()
                            
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .foregroundStyle(paleApricot)
                                .background(vibrantOrange)
                                
                        }
                    }
                    .listRowBackground(vibrantOrange)
                    
                    
                    Section("Desired amount of sleep"){
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    .listRowBackground(vibrantOrange)
                    
                    Section ("Daily Coffee Intake") {
                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    }
                    .listRowBackground(vibrantOrange)
                }
                .frame(maxHeight: 300)
                .tint(paleApricot)
                .foregroundStyle(paleApricot)
                .scrollContentBackground(.hidden)
                
                Spacer()
                
                Button {
                    calculateBedtime()
                } label: {
                    Text("Calculate")
                        .font(.headline.bold())
                        .frame(width: 200, height: 50)
                        .foregroundStyle(vibrantOrange)
                        .background(paleApricot)
                        .cornerRadius(25)
                }
                Spacer()
                Spacer()
                
            }
            .background(vibrantOrange)
            .navigationTitle("BetterRest")
            .toolbarBackground(.white, for: .navigationBar)
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
