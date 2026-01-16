//
//  AddGameView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI
import SwiftData

struct AddGameView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var gameName = ""
    @State private var sortByHighestScore = true
    @State private var winnerByHighestScore = true

    var body: some View {
        NavigationStack {
            Form {
                TextField("Game Name", text: $gameName)

                Toggle("Sort by highest score", isOn: $sortByHighestScore)
                Toggle("Winner by highest score", isOn: $winnerByHighestScore)
            }
            .navigationTitle("New Game")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let game = Game(
                            name: gameName,
                            sortByHighestScore: sortByHighestScore,
                            winnerByHighestScore: winnerByHighestScore
                        )
                        context.insert(game)
                        dismiss()
                    }
                    .disabled(gameName.isEmpty)
                }
            }
        }
    }
}

