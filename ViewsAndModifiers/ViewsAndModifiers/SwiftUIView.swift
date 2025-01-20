//
//  SwiftUIView.swift
//  ViewsAndModifiers
//
//  Created by Rahul Sharma on 20/01/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // This is possible because our body has an associated ViewBuilder, which silently wraps
        // these two view inside a tuple container return type when returning to swift
        
        // remember that SwiftUI get views in the form of tuple return types, even for Vstacks etc containing many views
        // it will returned as that many tuples
    }
}

#Preview {
    SwiftUIView()
}
