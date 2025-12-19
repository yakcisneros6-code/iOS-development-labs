//
//  ContentView.swift
//  animations
//
//  Created by Yaquelin Cisneros on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countdown: Int = 5
    @State private var gamestart: Bool = false
    @State private var countdownStarted: Bool = false
    @State private var number: Int = 0
    let numbers: [Int] = [1, 2, 3, 4, 5]
    
    let countdownDuration: Double = 1.0
    
    var body: some View {
        VStack(spacing: 50) {
            if countdownStarted || gamestart {
                CountDownView(countdown: $countdown, gamestart: $gamestart)
                    .frame(height: 150)
            }
            
            if gamestart {
                Text("\(number)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.pink)
            }
            
            Button("Start Game") {
                startGame()
            }
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(colors: [Color.pink, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(12)
            .shadow(color: Color.purple.opacity(0.4), radius: 10, x: 0, y: 5)
            .disabled(countdownStarted)
        }
        .padding()
        .background(Color.pink.opacity(0.1))
        .cornerRadius(20)
        .padding()
    }
    
    func startGame() {
        countdownStarted = true
        gamestart = false
        countdown = 5
        number = 0
        
        Task {
            for i in (1...5).reversed() {
                countdown = i
                try? await Task.sleep(for: .seconds(countdownDuration))
            }
            
            try? await Task.sleep(for: .seconds(0.5)) 
            gamestart = true
            number = numbers.randomElement() ?? 0
            countdownStarted = false
        }
    }
}

