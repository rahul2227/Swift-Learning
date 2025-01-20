//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Rahul Sharma on 20/01/25.
//

import SwiftUI

struct ViewModifierContentView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
//        .padding()
        .background(.green)
        .frame(width: 200, height: 200)
        
//        .padding()
//        .background(.red.gradient)
//        .padding()
//        .background(.blue.gradient)
//        .padding()
//        .background(.yellow.gradient)
        
        //The order of modifiers is important because it lets you stack the modifiers
        // this happens because swuiftUI make changes as you go down the modifier list in a view instead of making
        // changes on the entire view
        // like above swift first creates a button with text then gives it padding then says to color the background
        // of that padded button to green, if we keep repeating the padding and color modifiers it gives a bordered effect
        // on screen
    }
}

#Preview {
    ViewModifierContentView()
}
