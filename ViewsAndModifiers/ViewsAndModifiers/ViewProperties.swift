//
//  ViewProperties.swift
//  ViewsAndModifiers
//
//  Created by Rahul Sharma on 20/01/25.
//

import SwiftUI
//View composition
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

// Another way to split up your views is by using them as variables(for computed props) and/or by using
// them as let constants
// If you want to return multiple view inside your variable and constants then there are three ways
// @ViewBuilder(preferred as it does the things like swiftUI), Groups and Stacks

struct ViewProperties: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}

#Preview {
    ViewProperties()
}
