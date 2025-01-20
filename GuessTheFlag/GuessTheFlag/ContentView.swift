//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rahul Sharma on 18/01/25.
//

import SwiftUI


struct StyleTitle: ViewModifier {
    let titleWeight: Font.Weight
    func body(content: Content) -> some View {
        content.font(.largeTitle.weight(.bold))
    }
}

extension View {
    func titleStyled (boldness weight: Font.Weight) -> some View {
        modifier(StyleTitle(titleWeight: weight))
    }
}

struct FlagImage: View {
    let contryName: String
    var body: some View {
        Image(contryName)
            .clipShape(.rect(cornerRadius: 20.0))
            .shadow(radius: 5)
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
    
    
    var body: some View {
        ZStack {
            
            //            Color.blue
            //                .ignoresSafeArea()
            //            LinearGradient(colors: [
            //                Color(red: 89/255, green: 92/255, blue: 255/255),
            //                Color(red: 198/255, green: 248/255, blue: 255/255)], startPoint: .top, endPoint: .bottom)
            //                .ignoresSafeArea()
            LinearGradient(colors: [
                Color(red: 255/255, green: 147/255, blue: 15/255),
                Color(red: 255/255, green: 249/255, blue: 91/255)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                //                        .font(.largeTitle.weight(.bold))
                    .titleStyled(boldness: .bold)
                    .foregroundStyle(.black)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.black)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                        //                            .font(.largeTitle.weight(.semibold))
                            .titleStyled(boldness: .semibold)
                    }
                    ForEach(0..<3) { number in
                        Button {
                            if remainingQuestions > 0 {
                                flagTapped(number)
                                remainingQuestions -= 1
                            } else {
                                gameOver = true
                            }
                        } label: {
                            //                            Image(countries[number])
                            //                                .clipShape(.rect(cornerRadius: 20.0))
                            //                                .shadow(radius: 5)
                            FlagImage(contryName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 70.0)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 45)
                    .font(.title.bold())
                
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
            scoreTitle = "Wrong! That's the flag of  \(countries[number])!"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func restartGame() {
        userScore = 0
        askQuestion()
        remainingQuestions = 7
        gameOver = false
    }
}

#Preview {
    ContentView()
}
