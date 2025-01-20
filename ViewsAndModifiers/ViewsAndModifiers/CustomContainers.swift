//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Rahul Sharma on 20/01/25.
//

import SwiftUI

struct GridStack<Content: View> : View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach (0 ..< rows, id: \.self) { row in
                    HStack {
                    ForEach (0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4){ row, col in
//            HStack{ // Either this is possible to make this return multiple view or
                Image(systemName: "\(row * 4 + col).circle")
                Text("R:\(row), C:\(col)")
//            }
//            .padding()
//            .background(Color.yellow)
        } // If ViewBuilder is used then to create a grid color effect you have to use Hstack anyway
    }
}

#Preview {
    CustomContainers()
}
