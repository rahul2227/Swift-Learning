//
//  ContentView.swift
//  ConvertIt
//
//  Created by Rahul Sharma on 17/01/25.
//

import SwiftUI


func unitScale(_ selectedUnit: String) -> [String]? {
    var unitsString: [String]? = nil
    
    
    switch selectedUnit {
    case "Length":
        unitsString = ["N/A","Meters", "Kilometers"]
    case "Weight":
        unitsString = ["N/A","Kilograms", "Tons"]
    case "Temperature":
        unitsString = ["N/A","Celsius", "Fahrenheit"]
    case "Volume":
        unitsString = ["N/A","Liters", "KiloLiters"]
    default :
        unitsString = []
    }
    return unitsString
}

func convertValue(_ value: Double,_ inputUnit: String, _ outputUnit: String) -> Double {
    var result: Double = 0.0
    switch (inputUnit, outputUnit) {
    case ("Meters", "Kilometers"):
        result = value / 1000
    case ("Kilometers", "Meters"):
        result = value * 1000
    case ("Celsius", "Fahrenheit"):
        result = (value * 9.0 / 5.0) + 32.0
    case ("Fahrenheit", "Celsius"):
        result = (value - 32.0) * 5.0 / 9.0
    case ("Liters", "KiloLiters"):
        result = value / 1000
    case ("KiloLiters", "Liters"):
        result = value * 1000
    case ("Kilograms", "Tons"):
        result = value / 1000
    case ("Tons", "Kilograms"):
        result = value * 1000
    default:
        result = value
    }
    return result
}

struct ContentView: View {
    
    @State private var selectedUnit: String = "Length"
    let units: [String] = ["Length", "Weight", "Temperature", "Volume"]
    @State private var inputUnit: String = "N/A"
    @State private var outputUnit: String = "N/A"
    @State private var inputValue = 0.0
    @State private var outputValue = 0.0
    @FocusState private var isInputFocused: Bool
    @FocusState private var isOutputFocused: Bool
    
    var convertedValue: String {
        var results: Double = 0.0
        if isInputFocused {
            results = convertValue(inputValue, inputUnit, outputUnit)
        } else if isOutputFocused {
            results = convertValue(outputValue, outputUnit, inputUnit)
        }
        return String(format: "%.2f", results)
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Picker("", selection: $selectedUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                    .labelsHidden()
                
                Section ("Select your Input Unit"){
                    HStack{
                        TextField("Input value",value: $inputValue, format: .number).keyboardType(.decimalPad)
                            .focused($isInputFocused)
                        Spacer()
                        Picker("", selection: $inputUnit) {
                            let inputUnits = unitScale(selectedUnit) ?? ["No Input Units"]
                            ForEach(inputUnits, id: \.self) {
                                Text($0)
                            }
                        }.labelsHidden()
                            .pickerStyle(.menu)
                    }
                    if isOutputFocused {
                        Text("Value converted from output: \(convertedValue)")
                    }
                }
                
                Section ("Select your Output Unit"){
                    HStack{
                        TextField("Output value",value: $outputValue, format: .number).keyboardType(.decimalPad)
                            .focused($isOutputFocused)
                        Spacer()
                        Picker("", selection: $outputUnit) {
                            let inputUnits = unitScale(selectedUnit) ?? ["No Input Units"]
                            ForEach(inputUnits, id: \.self) {
                                Text($0)
                            }
                        }.labelsHidden()
                            .pickerStyle(.menu)
                    }
                    if isInputFocused {
                        Text("Value converted from input: \(convertedValue)")
                    }
                }
            }
            .navigationTitle("Convert iT")
        }
    }
}

#Preview {
    ContentView()
}
