//
//  ContentView.swift
//  AdvancedNavigation
//
//  Created by Yaquelin Cisneros on 12/5/25.
//

import SwiftUI

@Observable
class ContentViewModel {
    var timeLeft: Int = 3
    var timeRunning: Bool = true
    var numbers: [Int] = Array(1...10)
}

struct ContentView: View {
    var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Text("Start Game")
                .foregroundStyle(Color.pink)
                .padding()
                .background(Color.blue)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 1.5)) {
                        viewModel.timeRunning.toggle()
                    }
                }
                .onAppear {
                    withAnimation(
                        animateFirst.toggle()
                        
                }
            VStack {
                Image(systemName: "g")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

