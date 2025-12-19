//
//  GamesTrackerApp.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import SwiftUI
import SwiftData

@main
struct GameTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [Game.self, Player.self])
    }
}


struct RootView: View {
    @State private var gamesViewModel = GamesListViewModel() 
    @State private var showingAddGame = false
    @State private var selectedGame: Game? = nil

    var body: some View {
        NavigationView {
            GamesListView(viewModel: $gamesViewModel, onAddGame: {
                showingAddGame = true
            })
            .sheet(isPresented: $showingAddGame) {
                AddGameView(viewModel: $gamesViewModel) {
                    showingAddGame = false
                }
            }
        }
    }
}
