//
//  ContentView.swift
//  animations
//
//  Created by Yaquelin Cisneros on 12/5/25.
//

import SwiftUI
import Combine

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class ContentViewModel: ObservableObject {
     var timeLeft: Int = 5
    var numbers: [Int] = [1, 2, 3, 4, 5]
}

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    @State private var number: Int = 0
    @State private var countdown = 5
    @State private var gamestart: Bool = false
    @State private var countdownStarted: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            if gamestart {
                Text("Go")
                    .font(.largeTitle)
                    .bold()
            } else if countdownStarted {
                Text("\(countdown)")
                    .font(.system(size: 100))
                    .bold()
            }
            if gamestart {
                Text("\(number)")
                    .font(.largeTitle)
                    .padding()
            }
            
            
            Text("Start Game")
                .foregroundStyle(Color.purple)
                .padding()
                .background(Color.black)
                .cornerRadius(8)
                .onTapGesture {
                    Task {
                        
                        await  startCountdown()
                    }
                    .disabled(countdownStarted)
                }
                .padding()
        }
        
        func startCountdown() async {
            countdownStarted = true
            gamestart = false
            countdown = 5
            number = 0
            
            for i in 1...5).reversed() {
                countdown = i
                try? await Task.sleep(for: .seconds(1))
            }
            gamestart = true
            countdownStarted = false
            number = viewModel.numbers.randomElement() ?? 0
            
        }
    }
}
