//
//  AddPlayerView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI

struct AddPlayerView: View {
    var game: Game
    @Environment(\.dismiss) private var dismiss

    @State private var playerName = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Player Name", text: $playerName)
            }
            .navigationTitle("Add Player")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            game.players.append(Player(name: playerName))
                        }
                        dismiss()
                    }
                    .disabled(playerName.isEmpty)
                }
            }
        }
    }
}

