//
//  AnimationStackControl.swift
//  Animations
//
//  Created by Rahul Sharma on 01/02/25.
//

import SwiftUI

struct AnimationStackControl: View {
    @State private var enabled = false
    
    static let conclusion = """
    if we apply multiple animation() modifiers, each one controls everything before it up to the next animation. This allows us to animate state changes in all sorts of different ways rather than uniformly for all properties.
    """
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    AnimationStackControl()
}
