//
//  Untitled 2.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import Foundation

struct Post: Identifiable {
    let id: UUID = UUID()
    let userId: UUID
    let title: String
    let body: String
    var likesCount: Int = 0
    var commentsCount: Int = 0
    
   
}
