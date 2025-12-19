//
//  AddGameView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import SwiftUI
import Foundation

struct AddGameView: View {
    @Binding var viewModel: GamesListViewModel
    var onDismiss: (() -> Void)? = nil

    @State private var gameName: String = ""
    @State private var newPlayerName: String = ""
    @State private var players: [Player] = []
    @State private var sortByHighestScore: Bool = true
    @State private var winnerByHighestScore: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Game Name", text: $gameName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.pink.opacity(0.1))
                .cornerRadius(10)

            
            VStack(spacing: 10) {
                Picker("Sort Players By", selection: $sortByHighestScore) {
                    Text("Highest").tag(true)
                    Text("Lowest").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())

                Picker("Winner By", selection: $winnerByHighestScore) {
                    Text("Highest").tag(true)
                    Text("Lowest").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            .background(Color.purple.opacity(0.1))
            .cornerRadius(10)

            
            HStack {
                TextField("Player Name", text: $newPlayerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .background(Color.pink.opacity(0.1))
                    .cornerRadius(8)

                Button("Add") {
                    guard !newPlayerName.isEmpty else { return }
                    withAnimation {
                        players.append(Player(name: newPlayerName, score: Int.random(in: 0...20)))
                        newPlayerName = ""
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.pink.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding(.horizontal)

            
            List {
                ForEach(sortedPlayers()) { player in
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("\(player.score)").bold()
                        if player.id == currentWinner()?.id {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(10)
                }
                .onDelete { indexSet in
                    withAnimation {
                        for index in indexSet.sorted(by: >) {
                            players.remove(at: index)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())

            
            Button("Save Game") {
                let newGame = Game(
                    name: gameName,
                    players: players,
                    sortByHighestScore: sortByHighestScore,
                    winnerByHighestScore: winnerByHighestScore
                )
                viewModel.addGame(newGame)
                onDismiss?()
            }
            .disabled(gameName.isEmpty || players.isEmpty)
            .padding()
            .background(Color.pink.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("Add Game")
    }

    private func sortedPlayers() -> [Player] {
        if sortByHighestScore {
            return players.sorted { $0.score > $1.score }
        } else {
            return players.sorted { $0.score < $1.score }
        }
    }

    private func currentWinner() -> Player? {
        if winnerByHighestScore {
            return players.max(by: { $0.score < $1.score })
        } else {
            return players.min(by: { $0.score < $1.score })
        }
    }
}

