//
//  QuestionsSubview.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI

struct RangedQuestionSubview: View {
    let question: Question // the question we’re showing rn
    let currentIndex: Int // which question number we’re on
    let selectedAnswers: [Answer] // all the stuff user picked before
    let questions: [Question] // all questions in the quiz
    
    @State private var sliderValue: Double = 0.5 // the freaking slider position, starts in the middle

    var body: some View {
        VStack(spacing: 20) {
            Slider(value: $sliderValue) // user drags this left or right

            // figure out which answer they picked based on slider
            let chosen = sliderValue < 0.5 ? question.answers[0] : question.answers[1]

            // next button time
            if currentIndex + 1 < questions.count {
                // if more questions exist, go to next question
                NavigationLink("Next") {
                    QuestionFlowView(
                        currentIndex: currentIndex + 1, // bump to next question
                        selectedAnswers: selectedAnswers + [chosen] // remember what they picked
                    )
                }
                .padding()
                .background(Color.blue.opacity(0.3)) // make it a soft blue
                .cornerRadius(10) // roundy round
            } else {
                // if last question, go show results
                NavigationLink("Next") {
                    ResultsView(selectedAnswers: selectedAnswers + [chosen]) // save last pick
                }
                .padding()
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
            }
        }
    }
}

