//
//  ContentView.swift
//  Edutainment
//
//  Created by Rahul Sharma on 03/02/25.
//

import SwiftUI

struct SettingsView: View {
    
    var numberOfQuestions = [5, 10, 15]
    
    @State private var selectedNumberOfQuestions = 5
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Number of Questions")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Picker("Questions", selection: $selectedNumberOfQuestions) {
                        ForEach(numberOfQuestions, id: \.self) {
                            Text("\($0)")
                                .font(.title.bold())
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Choose the table you want to practice")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        ForEach(1..<4) { number in
                            Button {
                                // Do nothing
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                                    .frame(width: 70, height: 70)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        ForEach(4..<7) { number in
                            
                            Button {
                                // Do nothing
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                                    .frame(width: 70, height: 70)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        ForEach(7..<10) { number in
                            Button {
                                // Do nothing
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle(.black)
                                    .frame(width: 70, height: 70)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    Button {
                        // Do nothing
                    } label: {
                        Text("0")
                            .font(.title.bold())
                            .foregroundStyle(.black)
                            .frame(width: 70, height: 70)
                            .background(.white)
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Game Setting Menu")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
