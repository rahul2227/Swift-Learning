//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rahul Sharma on 18/01/25.
//

import SwiftUI


extension View {
    func titleStyled (boldness weight: Font.Weight) -> some View {
        modifier(StyleTitle(titleWeight: weight))
    }
}

struct StyleTitle: ViewModifier {
    let titleWeight: Font.Weight
    func body(content: Content) -> some View {
        content.font(.largeTitle.weight(.bold))
    }
}

struct FlagImage: View {
    @Binding var correctAnswer: Int
    @Binding var animateFlag: Bool
    let number: Int
    
    var scaleValue: Double {
        if (animateFlag && correctAnswer != number) {
            return 0.7
        }
        else {
            return 1.0
        }
    }
    
    let contryName: String
    var body: some View {
        Image(contryName)
            .clipShape(.rect(cornerRadius: 20.0))
            .shadow(radius: 5)
            .opacity((animateFlag && correctAnswer != number) ? 0.25 : 1.0)
            .rotation3DEffect(.init(degrees: (animateFlag && number == correctAnswer) ? 360.0 : 0.0), axis: (x:0, y:1, z:0))
            .scaleEffect(scaleValue)
        
    }
}

struct GameHeadingView: View {
    var body: some View {
        Text("Guess the Flag")
        //                        .font(.largeTitle.weight(.bold))
            .titleStyled(boldness: .bold)
            .foregroundStyle(.black)
    }
}

struct UserScoreView: View {
    @Binding var userScore: Int
    
    var body: some View {
        Text("Score: \(userScore)")
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, maxHeight: 70.0)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal, 45)
            .font(.title.bold())
            .animation(.default, value: userScore)
    }
}

struct BackgroundColorView: View {
    var body: some View {
        LinearGradient(colors: [
            Color(red: 255/255, green: 147/255, blue: 15/255),
            Color(red: 255/255, green: 249/255, blue: 91/255)], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct QuestionHeadingView: View {
    @Binding var correctAnswer: Int
    @Binding var countries: [String]
    
    var body: some View {
        VStack {
            Text("Tap the flag of")
                .foregroundStyle(.black)
                .font(.subheadline.weight(.heavy))
            Text(countries[correctAnswer])
                .foregroundStyle(.black)
                .titleStyled(boldness: .semibold)
        }
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var remainingQuestions = 7
    @State private var gameOver = false
    
    @State private var animateFlag = false
    
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            
            
            VStack {
                Spacer()
                
                GameHeadingView()
                
                Spacer()
                
                VStack(spacing: 15) {
                    
                    QuestionHeadingView(correctAnswer: $correctAnswer, countries: $countries)
                    
                    ForEach(0..<3) { number in
                        Button {
                            buttonActionLogic(for: number)
                        } label: {
                            
                            FlagImage(correctAnswer: self.$correctAnswer, animateFlag: self.$animateFlag, number: number, contryName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                UserScoreView(userScore: $userScore)
                
                Spacer()
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("Game Over", isPresented: $gameOver){
            Button("Restart", action: restartGame)
        } message: {
            Text("Your total score is \(userScore). Play again?")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 10
        } else {
            scoreTitle = "Wrong! That was the flag of  \(countries[number])!"
        }
        // This works for delaying the alert
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animateFlag = false
    }
    func restartGame() {
        userScore = 0
        askQuestion()
        remainingQuestions = 7
        gameOver = false
        animateFlag = false
    }
    
    func buttonActionLogic(for number: Int) {
        if remainingQuestions > 0 {
            flagTapped(number)
            remainingQuestions -= 1
            
            withAnimation {
                self.animateFlag = true
            }
            
        } else {
            gameOver = true
        }
    }
}

#Preview {
    ContentView()
}
