//
//  ViewModels.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI


// each answer has text and a turtle it points to hopefully 
struct Answer {
    let text: String
    let turtle: TurtleType
}

// each question has text type and answers
struct Question {
    let text: String
    let type: String // types my single options or mutiple options
    let answers: [Answer]
}

