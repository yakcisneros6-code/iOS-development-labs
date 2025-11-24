//
//  Recipe.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    
    var name: String
    var description: String
    var ingredients: [String]

}
