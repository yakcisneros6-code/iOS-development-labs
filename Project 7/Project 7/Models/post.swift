//
//  Untitled 2.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//
import Foundation
import SwiftUI

struct Post: Identifiable {
    var id = UUID()       
    var authorId: UUID
    var title: String
    var body: String
    var likes: Int
    var comments: [Comment] = []
}
