//
//  ScoreBoardView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI
import SwiftData

struct ScoreboardView: View {
    var game: Game

    @State private var showAddPlayer = false

    private var sortedPlayers: [Player] {
        game.players.sorted {
            game.sortByHighestScore ? $0.score > $1.score : $0.score < $1.score
        }
    }

    var body: some View {
        List {
            ForEach(sortedPlayers) { player in
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.pink)

                    Text(player.name)

                    Spacer()

                    Stepper("") {
                        withAnimation {
                            player.score += 1
                        }
                    } onDecrement: {
                        withAnimation {
                            player.score -= 1
                        }
                    }
                    .labelsHidden()

                    Text("\(player.score)")
                        .frame(width: 30)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    game.players.remove(at: index)
                }
            }
        }
        .navigationTitle("Scoreboard")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddPlayer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddPlayer) {
            AddPlayerView(game: game)
        }
    }
}






