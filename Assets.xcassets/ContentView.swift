//
//  ContentView.swift
//  geometry keyclass
//
//  Created by Yaquelin Cisneros on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Rectangle()
                    .fill(.purple)
                    .frame(width: geometry.size.width/2)
                Spacer()

                
            }
           
            background(.red)
        }
        .background(.green)
    }
}
#Preview {
    ContentView()
}
