//
//  Dog.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import Foundation

struct Dog: Identifiable {
    let id = UUID()
    var name: String = ""
    var image: String
}

