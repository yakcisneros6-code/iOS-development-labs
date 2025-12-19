//
//  GamesListView.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import SwiftUI

struct GamesListView: View {
    @Binding var viewModel: GamesListViewModel
    var onAddGame: (() -> Void)? = nil

    var body: some View {
        List {
            ForEach(viewModel.games) { game in
                NavigationLink(
                    destination: ScoreboardView(
                        viewModel: ScoreboardViewModel(
                            players: game.players,
                            sortByHighestScore: game.sortByHighestScore
                        )
                    )
                ) {
                    HStack(spacing: 15) {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(.pink)
                            .font(.title2)
//pink because i like it 
                        VStack(alignment: .leading) {
                            Text(game.name)
                                .font(.headline)
                            if let winner = game.winner().first {
                                Text("Current winner: \(winner.name)")
                                    .font(.subheadline)
                                    .foregroundColor(.purple)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.pink.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .onDelete { indexSet in
                withAnimation { viewModel.removeGames(at: indexSet) }
            }
            .onMove { indices, newOffset in
                withAnimation { viewModel.moveGames(from: indices, to: newOffset) }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Games")
        .navigationBarItems(
            leading: EditButton(),
            trailing: Button(action: { onAddGame?() }) {
                Image(systemName: "plus")
                    .foregroundColor(.pink)
                    .font(.title2)
            }
        )
    }
}

