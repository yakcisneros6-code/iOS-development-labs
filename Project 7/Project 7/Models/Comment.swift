//
//  Untitled.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//


import Foundation

struct Comment: Identifiable {
    
    let id: UUID = UUID()
    let postId: UUID
    let userId: UUID
    var text: String
}


