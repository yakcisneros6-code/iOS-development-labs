//
//  Dragon.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/12/26.
//

import SwiftUI

struct Dragon: Identifiable, Hashable {

    let id = UUID()
    let image: String
    let name: String
    let species: String
    let lore: String
    let fireRating: Int
    let weaknesses: [String]
    let abilities: [String]

    static let sample: [Dragon] = [
        Dragon(
            image: "dragon1",
            name: "Brisa",
            species: "Air Dragon",
            lore: "Fast and calm, loves high winds.",
            fireRating: 2,
            weaknesses: ["Ice", "Heavy armor"],
            abilities: ["Wind Glide", "Pressure Burst"]
        ),
        Dragon(
            image: "dragon2",
            name: "Tierra",
            species: "Earth Dragon",
            lore: "Strong and protective.",
            fireRating: 1,
            weaknesses: ["Water"],
            abilities: ["Stone Shield", "Ground Slam"]
        ),
        Dragon(
            image: "dragon3",
            name: "Fuego",
            species: "Fire Dragon",
            lore: "Hot-headed and powerful.",
            fireRating: 10,
            weaknesses: ["Water"],
            abilities: ["Flame Burst", "Heat Wave"]
        ),
        Dragon(
            image: "dragon4",
            name: "Hielo",
            species: "Ice Dragon",
            lore: "Cold and sharp.",
            fireRating: 0,
            weaknesses: ["Fire"],
            abilities: ["Freeze", "Ice Spikes"]
        )
    ]
}
