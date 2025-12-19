//
//  Game.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import Foundation


struct Game: Identifiable, Codable {
var id = UUID()
var name: String
var date: Date = Date()
var players: [Player] = []
var sortByHighestScore: Bool = true
var winnerByHighestScore: Bool = true

    init(
        id: UUID = UUID(),
        name: String,
        date: Date = Date(),
        players: [Player] = [],
        sortByHighestScore: Bool = true,
        winnerByHighestScore: Bool = true
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.players = players
        self.sortByHighestScore = sortByHighestScore
        self.winnerByHighestScore = winnerByHighestScore
    }

    //had a hard time figuering this out
    func winner() -> [Player] {
        guard !players.isEmpty else { return [] }
        if winnerByHighestScore {
            let maxScore = players.map { $0.score }.max() ?? 0
            return players.filter { $0.score == maxScore }
        } else {
            let minScore = players.map { $0.score }.min() ?? 0
            return players.filter { $0.score == minScore }
        }
    }

    
    mutating func sortPlayers() {
        if sortByHighestScore {
            players.sort { $0.score > $1.score }
        } else {
            players.sort { $0.score < $1.score }
        }
    }

    // scores and sorts 
    mutating func updateScore(for playerID: UUID, newScore: Int) {
        if let index = players.firstIndex(where: { $0.id == playerID }) {
            players[index].score = newScore
            sortPlayers()
        }
    }
}

// stores all my info for players scores and sroting and winner 
