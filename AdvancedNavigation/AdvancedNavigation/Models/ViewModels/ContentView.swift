//
//  ContentView.swift
//  animations
//
//  Created by Yaquelin Cisneros on 12/5/25.
//

import SwiftUI

struct ContentView: View {
@Namespace private var namespace
    @State private var countDown = 5
    @State private var gameStarted = false

    var body: some View {
        VStack(spacing: 40) {

            if gameStarted {
                CountdownDisplay(
                    number: countDown,
                    namespace: namespace
                )

            }

            Button("Start Countdown") {
                startCountdown()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.pink)
            .cornerRadius(12)
            .disabled(gameStarted)
        }
        .padding()
    }

    func startCountdown() {
        gameStarted = true
        countDown = 5

        Task {
            for value in stride(from: 5, through: 0, by: -1) {
                countDown = value
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
}

