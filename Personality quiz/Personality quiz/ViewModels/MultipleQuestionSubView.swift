//
//  multipleQuestions.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    let question: Question
    let currentIndex: Int
    let selectedAnswers: [Answer]
    let questions: [Question]
    //these are on false so when i pick something it makes it true so it makes it the answer
    @State private var selections = [false, false, false, false]
    
    var body: some View {
        VStack(spacing: 15) {
            // 4 toggles for my otptions
            Toggle(question.answers[0].text, isOn: $selections[0])
            Toggle(question.answers[1].text, isOn: $selections[1])
            Toggle(question.answers[2].text, isOn: $selections[2])
            Toggle(question.answers[3].text, isOn: $selections[3])
            
            // user picks  answers
            let chosen = (0..<selections.count).compactMap { selections[$0] ? question.answers[$0] : nil }
            
            if currentIndex + 1 < questions.count {
                NavigationLink("Next") {
                    QuestionFlowView(currentIndex: currentIndex + 1,
                                     selectedAnswers: selectedAnswers + chosen)
                }
                .padding()
                .background(Color.green.opacity(0.3))
                .cornerRadius(10)
            } else {
                NavigationLink("Next") {
                    ResultsView(selectedAnswers: selectedAnswers + chosen)
                }
                .padding()
                .background(Color.green.opacity(0.3))
                .cornerRadius(10)
            }
        }
    }
}
