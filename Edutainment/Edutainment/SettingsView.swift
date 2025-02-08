//
//  ContentView.swift
//  Edutainment
//
//  Created by Rahul Sharma on 03/02/25.
//

import SwiftUI

struct Questions {
    private var numberofQuestions: Int
    let questions: [Int]
    
    init(numberofQuestions: Int) {
        self.numberofQuestions = numberofQuestions
        self.questions = []
    }
    
    func getRandomQuestions() -> [Int] {
        var questions: [Int] = []
        for i in 1...numberofQuestions {
            questions.append(i)
        }
        questions.shuffle()
        return questions
    }
}

struct SettingsView: View {
    
    var numberOfQuestions = [5, 10, 15]
    
    @State private var selectedNumberOfQuestions = 5
    @State private var selectedTableToPractice = 0
    @State private var buttonSelected  = true
    
    var linearGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var linearGradientWhite: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var questions: [Int] {
        let questionInstance = Questions(numberofQuestions: selectedNumberOfQuestions)
        let questions = questionInstance.getRandomQuestions( )
        return questions
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                linearGradient
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
                    .padding()
                    
                    Text("Choose the table you want to practice")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        ForEach(1..<4) { number in
                            Button {
                                selectedTableToPractice = number
                                buttonSelected = true
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle((buttonSelected && selectedTableToPractice == number) ? .white : .black)
                                    .frame(width: 70, height: 70)
                                    .background((buttonSelected && selectedTableToPractice == number) ? linearGradient : linearGradientWhite)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        ForEach(4..<7) { number in
                            
                            Button {
                                selectedTableToPractice = number
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle((buttonSelected && selectedTableToPractice == number) ? .white : .black)
                                    .frame(width: 70, height: 70)
                                    .background((buttonSelected && selectedTableToPractice == number) ? linearGradient : linearGradientWhite)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    HStack {
                        ForEach(7..<10) { number in
                            Button {
                                selectedTableToPractice = number
                            } label: {
                                Text("\(number)")
                                    .font(.title.bold())
                                    .foregroundStyle((buttonSelected && selectedTableToPractice == number) ? .white : .black)
                                    .frame(width: 70, height: 70)
                                    .background((buttonSelected && selectedTableToPractice == number) ? linearGradient : linearGradientWhite)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    
                    // TODO: Add this after adding functionality for second number
                    //                    Button {
                    //                        // Do nothing
                    //                    } label: {
                    //                        Text("0")
                    //                            .font(.title.bold())
                    //                            .foregroundStyle(.black)
                    //                            .frame(width: 70, height: 70)
                    //                            .background(.white)
                    //                            .clipShape(Circle())
                    //                            .padding()
                    //                    }
                    
                    
                    NavigationLink(destination: GameView(
                        numberOfQuestionsToBeAsked: selectedNumberOfQuestions, selectedNumberToPractice: selectedTableToPractice,
                        questions: questions
                    )) {
                        Text("Start the Game ?")
                        
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 300)
                            .background(.purple.gradient)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
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
