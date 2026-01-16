//
//  Player.swift
//  GamesTracker
//
//  Created by Yaquelin Cisneros on 12/17/25.
//

import SwiftData

@Model
class Player {
    var name: String
    var score: Int

    init(name: String, score: Int = 0) {
        self.name = name
        self.score = score
    }
}

