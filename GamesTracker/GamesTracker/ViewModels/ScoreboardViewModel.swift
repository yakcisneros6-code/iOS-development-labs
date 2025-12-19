//
//  ScoreboardViewModel.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//
import Foundation

class ScoreboardViewModel {
    var players: [Player]
    var sortByHighestScore: Bool
    var onPlayersUpdated: (([Player]) -> Void)?

    
    init(players: [Player], sortByHighestScore: Bool, onPlayersUpdated: (([Player]) -> Void)? = nil) {
        self.players = players
        self.sortByHighestScore = sortByHighestScore
        self.onPlayersUpdated = onPlayersUpdated
        sortPlayers()
    }

    
    func addPlayer(_ player: Player) {
        players.append(player)
        sortPlayers()
        onPlayersUpdated?(players)
    }

    
    func updateScore(for index: Int, newScore: Int) {
        guard players.indices.contains(index) else { return }
        players[index].score = newScore
        sortPlayers()
        onPlayersUpdated?(players)
    }

    
    func removePlayers(at offsets: IndexSet) {
        for index in offsets.sorted(by: >) {
            players.remove(at: index)
        }
        sortPlayers()
        onPlayersUpdated?(players)
    }

    
    func sortPlayers() {
        if sortByHighestScore {
            players.sort { $0.score > $1.score }
        } else {
            players.sort { $0.score < $1.score }
        }
    }
}




