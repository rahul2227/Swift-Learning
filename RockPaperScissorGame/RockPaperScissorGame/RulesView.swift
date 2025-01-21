//
//  ContentView.swift
//  RockPaperScissorGame
//
//  Created by Rahul Sharma on 21/01/25.
//

import SwiftUI

struct RulesStyle: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font(.body.bold())
    }
}

struct RoundedButtonStyle: ViewModifier {
    
    let backgroundColor: Color
    
    init(backgroundColor: Color = .green) {
        self.backgroundColor = backgroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: 250, maxHeight: 50, alignment: .center)
            .background(backgroundColor.gradient)
            .shadow(radius: 5)
            .cornerRadius(25)
    }
}

extension View {
    func rulesStyled() -> some View {
        self.modifier(RulesStyle())
    }
    func roundedButtonStyled(backgroundColor: Color = .green) -> some View {
        self.modifier(RoundedButtonStyle(backgroundColor: backgroundColor))
    }
}

struct RulesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.yellow.opacity(0.2).ignoresSafeArea()
                
                VStack{
                    
                    Spacer()
                    
                    HStack(alignment: .center){
                        Text("Rules")
                            .font(.title.bold())
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("1. Each turn of the game the app will randomly pick either rock, paper, or scissors.")
                            .rulesStyled()
                            .padding(.vertical)
                        Text("2. Each turn the app will alternate between prompting the player to win or lose.")
                            .rulesStyled()
                            .padding(.vertical)
                        Text("3. The player must then tap the correct move to win or lose the game.")
                            .rulesStyled()
                            .padding(.vertical)
                        Text("4. If they are correct they score a point; otherwise they lose a point.")
                            .rulesStyled()
                            .padding(.vertical)
                        Text("5. The game ends after 10 questions, at which point their score is shown.")
                            .rulesStyled()
                            .padding(.vertical)
                    }
                    .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: GameArea()) {
                        Text("Continue To Game!")
                            .foregroundStyle(.black)
                            .roundedButtonStyled(backgroundColor: .yellow)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    RulesView()
}
