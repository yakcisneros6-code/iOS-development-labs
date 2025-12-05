//
//  Untitled.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//


import Foundation
import SwiftUI

struct Comment: Identifiable {
    let id: UUID = UUID()      
    let postId: UUID
    let authorId: UUID
    var text: String
}
