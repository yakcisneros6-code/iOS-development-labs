//
//  GamesListViewModel.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import Foundation
import SwiftUI

class GamesListViewModel {
    
private var storedGames: [Game] = []

    
    var games: [Game] {
        storedGames
    }

  
private let saveKey = "SavedGames"

    
    init() {
        loadGames()
        sortGames()
    }


    func addGame(_ game: Game) {
        storedGames.append(game)
        sortGames()
        saveGames()
    }

    func removeGames(at offsets: IndexSet) {
        storedGames.remove(atOffsets: offsets)
        sortGames()
        saveGames()
    }

    func moveGames(from source: IndexSet, to destination: Int) {
        storedGames.move(fromOffsets: source, toOffset: destination)
        saveGames()
    }

    func updateGame(at index: Int, with game: Game) {
        guard storedGames.indices.contains(index) else { return }
        storedGames[index] = game
        sortGames()
        saveGames()
    }
//$1 = secomd item
    func sortGames() {
        storedGames.sort { $0.date > $1.date }
    }

    func winners(for game: Game) -> [Player] {
        return game.winner()
    }

  

    func addPlayer(to gameID: UUID, player: Player) {
        guard let index = storedGames.firstIndex(where: { $0.id == gameID }) else { return }
        storedGames[index].players.append(player)
        storedGames[index].sortPlayers()
        saveGames()
    }

    func removePlayers(at offsets: IndexSet, from gameID: UUID) {
        guard let index = storedGames.firstIndex(where: { $0.id == gameID }) else { return }
        for offset in offsets.sorted(by: >) {
            storedGames[index].players.remove(at: offset)
        }
        storedGames[index].sortPlayers()
        saveGames()
    }

    func updatePlayerScore(gameID: UUID, playerID: UUID, newScore: Int) {
        guard let gameIndex = storedGames.firstIndex(where: { $0.id == gameID }) else { return }
        guard let playerIndex = storedGames[gameIndex].players.firstIndex(where: { $0.id == playerID }) else { return }
        storedGames[gameIndex].players[playerIndex].score = newScore
        storedGames[gameIndex].sortPlayers()
        saveGames()
    }

    //games save on my phone
    private func saveGames() {
        if let encoded = try? JSONEncoder().encode(storedGames) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
//load my games
    private func loadGames() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Game].self, from: data) {
            storedGames = decoded
        }
    }
}

