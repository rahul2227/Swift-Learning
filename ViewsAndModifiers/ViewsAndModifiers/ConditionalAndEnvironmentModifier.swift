//
//  Conditional modifier.swift
//  ViewsAndModifiers
//
//  Created by Rahul Sharma on 20/01/25.
//

import SwiftUI

struct ConditionalModifier: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}


struct EnvironmentModifier: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle) // this is a custom modifier of the text and it will have priority
            // over environment modifier and hence this will override the UI modification for this Text
            // UI component different from our Environment modifier
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title) // This is an environment modifier so it will have effect in all of the text
    }
}

#Preview {
    ConditionalModifier()
//    EnvironmentModifier() // This will merge the contents of two structs in a VStack format
} // and then display them in a single modifier


#Preview { // This will create a new preview in another preview tab
    EnvironmentModifier()
}
