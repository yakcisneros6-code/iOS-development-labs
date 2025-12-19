//
//  ScoreBoardView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI
import SwiftData

struct ScoreboardView: View {
    let game: Game

    @Environment(\.modelContext) private var modelContext
    @State private var showingAddPlayer = false
    @State private var bouncePlayerID: UUID? = nil

    private var sortedPlayers: [Player] {
        game.players.sorted {
            game.sortHighestFirst ? $0.score > $1.score : $0.score < $1.score
        }
    }

    var body: some View {
        List {
            ForEach(sortedPlayers) { player in
                HStack {
                    Image(systemName: "person.fill")
                        .font(.title2)

                    Text(player.name)
                        .font(.body)
                        .padding(.leading, 5)

                    Spacer()

                    Stepper(
                        "",
                        value: Binding(
                            get: { player.score },
                            set: { newScore in
                                withAnimation {
                                    player.score = newScore
                                }
                            }
                        ),
                        in: 0...20
                    )
                    .labelsHidden()
                    .frame(width: 100)

                    Text("\(player.score)")
                        .frame(width: 30, alignment: .trailing)
                }
                .padding(.vertical, 5)
                .scaleEffect(player.id == bouncePlayerID ? 1.3 : 1.0)
                .animation(
                    .spring(response: 0.3, dampingFraction: 0.3),
                    value: bouncePlayerID
                )
            }
            .onDelete { indexSet in
                withAnimation {
                    for index in indexSet {
                        modelContext.delete(sortedPlayers[index])
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Scoreboard")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddPlayer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddPlayer) {
            AddPlayerView { playerName in
                let newPlayer = Player(name: playerName)
                withAnimation {
                    game.players.append(newPlayer)
                }
                animateBounce(playerID: newPlayer.id)
            }
        }
    }

    private func animateBounce(playerID: UUID) {
        bouncePlayerID = playerID
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            bouncePlayerID = nil
        }
    }
}






