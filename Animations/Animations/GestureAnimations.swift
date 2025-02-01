//
//  GestureAnimations.swift
//  Animations
//
//  Created by Rahul Sharma on 01/02/25.
//

import SwiftUI

struct GestureAnimations: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(DragGesture()
                .onChanged { dragAmount = $0.translation}
                .onEnded { _ in dragAmount = .zero }
            )
            .animation(.bouncy, value: dragAmount)
    }
}

struct SnakeAnimation: View {
    let letters = Array("Snake Animation")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach (0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .red : .blue)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num)/20), value: dragAmount)
            }
        }.gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    GestureAnimations()
}

#Preview {
    SnakeAnimation()
}
