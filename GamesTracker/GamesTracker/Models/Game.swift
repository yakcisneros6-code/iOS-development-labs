//
//  Game.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import SwiftData
import Foundation

@Model
class Game {
    var name: String
    var createdAt: Date
    var sortByHighestScore: Bool
    var winnerByHighestScore: Bool
    var players: [Player]

    init(
        name: String,
        sortByHighestScore: Bool = true,
        winnerByHighestScore: Bool = true
    ) {
        self.name = name
        self.createdAt = Date()
        self.sortByHighestScore = sortByHighestScore
        self.winnerByHighestScore = winnerByHighestScore
        self.players = []
    }
}

// stores all my info for players scores and sroting and winner 
