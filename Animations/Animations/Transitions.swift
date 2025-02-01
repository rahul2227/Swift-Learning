//
//  Transitions.swift
//  Animations
//
//  Created by Rahul Sharma on 01/02/25.
//

import SwiftUI

struct Transitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        Button("Tap Me") {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        if isShowingRed{
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(AsymmetricTransition(insertion: .scale, removal: .opacity))
        }
    }
}

#Preview {
    Transitions()
}
