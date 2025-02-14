//
//  ContentView.swift
//  ValentineMode
//
//  Created by Rahul Sharma on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var areYouSingle: Bool = true
    
    
    var body: some View {
        ZStack {
            
            areYouSingle ? LinearGradient(colors: [.black, .gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            : LinearGradient(colors: [.red, .pink, .orange], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            if (areYouSingle) {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)){
                        areYouSingle.toggle()
                    }
                } label: {
                    Text("Are you single?")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
                .transition(.scale)
            } else {
                VStack {
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 150))
                        .foregroundStyle(.orange.gradient)
                        .symbolEffect(.bounce.down.byLayer, options: .repeat(.periodic(delay: 0.0)))
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)){
                            areYouSingle.toggle()
                        }
                    } label: {
                        Text("Don't Worry! You will find someone soon...")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
