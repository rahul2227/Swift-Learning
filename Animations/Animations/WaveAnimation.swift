//
//  WaveAnimation.swift
//  Animations
//
//  Created by Rahul Sharma on 30/01/25.
//

import SwiftUI

struct WaveAnimation: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me!") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        ).onAppear {
            animationAmount = 2
        }
    }
        
}

#Preview {
    WaveAnimation()
}
