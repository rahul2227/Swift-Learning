//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rahul Sharma on 18/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
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
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.black)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.black)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 20.0))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: ???")
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
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
