//
//  results.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI

struct ResultsView: View {
    let selectedAnswers: [Answer] // these are all the answers the user picked

    // figure out which turtle you picked the most
    func mostCommonTurtle() -> TurtleType {
        // count how many times each turtle shows up in the answers
        let counts = Dictionary(grouping: selectedAnswers, by: { $0.turtle }).mapValues { $0.count }
        // pick the turtle with the highest number, default to Leo if something goes wrong
        return counts.max(by: { $0.value < $1.value })?.key ?? .leo
    }
    
    var body: some View {
        VStack(spacing: 30) {
            let turtle = mostCommonTurtle() // get your turtle
            Text("You are \(turtle.rawValue)!") // show which turtle you are
                .font(.largeTitle)
            Text("This means you are awesome like \(turtle.rawValue).")
                .font(.title2)
        }
        .padding()
    }
}
