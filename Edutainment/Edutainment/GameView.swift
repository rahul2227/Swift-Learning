//
//  GameView.swift
//  Edutainment
//
//  Created by Rahul Sharma on 04/02/25.
//

import SwiftUI



struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var numberOfQuestionsToBeAsked: Int
    var selectedNumberToPractice: Int
    var questions: [Int]
    
    @State private var userAnswer = ""
    
    @State private var answerIsCorrect: Bool = false
    @State private var userHasSubmittedAnswer: Bool = false
    
    @State private var isShowingAlert: Bool = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var gameHasEnded: Bool = false
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("\(selectedNumberToPractice) x \(questions[numberOfQuestionsToBeAsked - 1])")
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
                        if Int(userAnswer)! == selectedNumberToPractice * questions[numberOfQuestionsToBeAsked - 1] {
                            answerIsCorrect = true
                        } else {
                            answerIsCorrect = false
                        }
                        
                        userHasSubmittedAnswer = true
                        
                        if numberOfQuestionsToBeAsked == 0 {
                            gameHasEnded = true
                        }
                        
                        callAlert()
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
            .alert(isPresented: $isShowingAlert) {
                if numberOfQuestionsToBeAsked != 0{
                    if answerIsCorrect {
                        return Alert(title: Text("Correct!"), message: Text("You got it right!"), dismissButton: .default(Text("Continue")))
                    } else {
                        return Alert(title: Text("Oops!"), message: Text("You got it wrong!"), dismissButton: .default(Text("Continue")))
                    }
                } else {
                    return Alert(title: Text("Game Over!"), message: Text("Game is over!"), primaryButton: .default(Text("restart Game?")), secondaryButton: .destructive(Text("Don't wanna play")))
                }
            }
        }
    }
    
    func callAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            isShowingAlert = true
            roundChange()
        }
        // TODO: Make GameView to be rootview
        // Make it that Game over function will lead to the settings view
        // TODO: Fix the bug of when the game ends
    }
    
    func roundChange() {
        numberOfQuestionsToBeAsked -= 1
        userHasSubmittedAnswer = false
        userAnswer = ""
    }
}

#Preview {
    GameView(numberOfQuestionsToBeAsked: 5, selectedNumberToPractice: 5, questions: [4,6])
}
