//
//  GameArena1.swift
//  RockPaperScissorGame
//
//  Created by Rahul Sharma on 21/01/25.
//

import SwiftUI

struct GameCardDesign: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(width: 370, height: 250, alignment: .center)
            .background(color)
            .cornerRadius(20)
            .padding()
    }
}

extension View {
    func gameCardDesigned(ofColor color: Color) -> some View {
        self.modifier(GameCardDesign(color: color))
    }
}

struct GameArea: View {
    
    let gameDecisions: [String] = ["Rock", "Paper", "Scissors"]
    @State private var decision = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var playerWon: Bool = false
    @State private var showAlert: Bool = false
    @State private var remainingGameRounds: Int = 10
    @State private var gameOver: Bool = false
    @State private var playerScore: Int = 0
    @State private var playerChoice: Int = 0
    
    @State private var playerMadeDecision = false
    
    var body: some View {
        ZStack {
            
            playerShouldWin
            ? Color.green.opacity(0.3).ignoresSafeArea()
            : Color.red.opacity(0.3).ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text(playerMadeDecision ? gameDecisions[decision] : "App's choice: ...")
                    .gameCardDesigned(ofColor: .red)
                    .font(.title)
                
                Divider()
                    .frame(width: .infinity, height: 3)
                    .background(Color.black)
                    .padding(.vertical)
                

                
                if (playerMadeDecision) {
                    Button {
                        gameEvaluation(choiceMade: playerChoice)
                    } label : {
                        Text("\(gameDecisions[playerChoice])")
                            .gameCardDesigned(ofColor: .blue)
                            .font(.title)
                    }
                        
                } else {
                    VStack {
                        Button{
                            if (remainingGameRounds != 0){
                                playerChoice = 0
                                remainingGameRounds -= 1
                                playerMadeDecision = true
                            } else {
                                gameOver = true
                            }
                        }label: {
                            Text("Rock")
                                .roundedButtonStyled(backgroundColor: .blue)
                        }
                        Button{
                            if (remainingGameRounds != 0){
                                playerChoice = 1
                                remainingGameRounds -= 1
                                playerMadeDecision = true
                            } else {
                                gameOver = true
                            }
                        }label: {
                            Text("Paper")
                                .roundedButtonStyled(backgroundColor: .blue)
                        }
                        Button{
                            if (remainingGameRounds != 0){
                                playerChoice = 2
                                remainingGameRounds -= 1
                                playerMadeDecision = true
                            } else {
                                gameOver = true
                            }
                        }label: {
                            Text("Scissor")
                                .roundedButtonStyled(backgroundColor: .blue)
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .alert(playerWon ? "Congratulations!" : "Better luck next time!", isPresented: $showAlert) {
            Button("Continue!", action: roundreset)
        } message: {
            playerWon
            ? Text("Player Won the round!")
            : Text("Player Lost the round!")
        }
        .alert("Game Over!", isPresented: $gameOver) {
            Button("Restart Game?", action: gameReset)
        } message: {
            Text("Your Final Score is \(playerScore)")
        }
    }
    
    func gameEvaluation(choiceMade: Int) {
        if playerShouldWin {
            if (decision == 2 && choiceMade == 0) {
                playerWon = true
                playerScore += 1
            } else if (decision < choiceMade) {
                playerWon = true
                playerScore += 1
            } else {
                playerWon = false
                playerScore -= 1
            }
        } else {
            if (decision == 0 && choiceMade == 2) {
                playerWon = true
                playerScore += 1
            } else if (decision > choiceMade) {
                playerWon = true
                playerScore += 1
            } else {
                playerWon = false
                playerScore -= 1
            }
        }
        showAlert = true
    }
    
    func roundreset() {
        decision = Int.random(in: 0...2)
        playerShouldWin.toggle()
        playerMadeDecision = false
    }
    func gameReset() {
        playerScore = 0
        remainingGameRounds = 10
        roundreset()
    }
}

#Preview {
    GameArea()
}
