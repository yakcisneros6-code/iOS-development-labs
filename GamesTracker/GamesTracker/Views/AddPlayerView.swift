//
//  AddPlayerView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI
import Foundation

struct AddPlayerView: View {
    @Binding var players: [Player]
    var onDismiss: (() -> Void)? = nil
    var onAddAndBounce: ((UUID) -> Void)? = nil

    @State private var playerName: String = ""
    @State private var playerScore: String = ""

    var body: some View {
        VStack(spacing: 30) {
            Text("Add New Player")
                .font(.headline)
                .padding(.top, 40)

            VStack(alignment: .leading, spacing: 10) {
                Text("Player Name:")
                    .font(.subheadline)
                TextField("Enter name", text: $playerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Current Score:")
                    .font(.subheadline)
                TextField("0", text: $playerScore)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.horizontal, 30)

            Spacer()

            Button(action: savePlayer) {
                Text("Save Player")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
            .disabled(playerName.isEmpty)
        }
    }

    private func savePlayer() {
        
        let score = Int(playerScore) ?? 0
        let newPlayer = Player(name: playerName, score: score)

        
        withAnimation {
            players.append(newPlayer)
        }

        
        onAddAndBounce?(newPlayer.id)

        
        onDismiss?()
    }
}




