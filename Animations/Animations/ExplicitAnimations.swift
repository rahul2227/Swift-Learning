//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Rahul Sharma on 31/01/25.
//

import SwiftUI

struct ExplicitAnimations: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation (.spring(duration: 1, bounce: 0.5)){
                animationAmount += 360
            } // This is the explicit animation, where we explicitly change that when this value changes, animate our view with the animation we implemented
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//        .animation(.spring(duration: 1, bounce: 0.5), value: animationAmount)
            // This is implicit animation where we are changing our view based on the animation we specified
        // like here if we do animation(.default, value) then it will just perform rotation animation
    }
}

#Preview {
    ExplicitAnimations()
}
