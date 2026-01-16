//
//  GamesListView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import SwiftUI
import SwiftData

struct GamesListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Game.createdAt, order: .reverse)
    private var games: [Game]

    @State private var showAddGame = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(games) { game in
                    NavigationLink {
                        ScoreboardView(game: game)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .font(.headline)

                            Text(currentWinnerText(for: game))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(games[index])
                    }
                }
            }
            .navigationTitle("Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddGame = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddGame) {
                AddGameView()
            }
        }
    }

    private func currentWinnerText(for game: Game) -> String {
        guard !game.players.isEmpty else {
            return "No players yet"
        }

        let sortedPlayers = game.players.sorted {
            game.winnerByHighestScore ? $0.score > $1.score : $0.score < $1.score
        }

        return "Winning: \(sortedPlayers.first!.name)"
    }
}

