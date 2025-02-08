//
//  GameView.swift
//  Edutainment
//
//  Created by Rahul Sharma on 04/02/25.
//

import SwiftUI


struct Questions {
    private var numberofQuestions: Int
    let questions: [Int]
    
    init(numberofQuestions: Int) {
        self.numberofQuestions = numberofQuestions
        self.questions = (0..<numberofQuestions).map { _ in Int.random(in: 0...12) }
    }
}

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var numberOfQuestionsToBeAsked: Int
    @State var selectedNumberToPractice: Int
    
    var questions: [Int] {
       let out = Questions(numberofQuestions: numberOfQuestionsToBeAsked)
        return out.questions
    }
    
    @State private var userAnswer = ""
    
    @State private var answerIsCorrect: Bool = false
    @State private var userHasSubmittedAnswer: Bool = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("\(selectedNumberToPractice) x \(questions[0])")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    
                    TextField("Your Answer", text: $userAnswer)
                        .padding()
                        .background(
                            userHasSubmittedAnswer
                            ? (answerIsCorrect) ? Color.green.opacity(0.7) : Color.red.opacity(0.7)
                            : Color.white
                        )
                        .cornerRadius(10)
                        .padding()
                        .keyboardType(.numberPad)
                    
                    Button{
                        if Int(userAnswer)! == selectedNumberToPractice * questions[0] {
                            answerIsCorrect = true
                        } else {
                            answerIsCorrect = false
                        }
                        
                        userHasSubmittedAnswer = true
                    } label: {
                        Text("Check Answer")
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Game Start")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left.chevron.left.dotted")
                            .foregroundColor(.white)
                    }.symbolEffect(.bounce.down.byLayer, options: .nonRepeating)
                }
            }
        }
    }
}

#Preview {
    GameView(numberOfQuestionsToBeAsked: 5, selectedNumberToPractice: 5)
}
