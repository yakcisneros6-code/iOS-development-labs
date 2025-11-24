//
//  User.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/21/25.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let username: String
    var bio: String?
    var avatarName: String?
}
