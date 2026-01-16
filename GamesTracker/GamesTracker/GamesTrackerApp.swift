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
            GamesListViewModel()
        }
        .modelContainer(for: [Game.self, Player.self])
    }
}
