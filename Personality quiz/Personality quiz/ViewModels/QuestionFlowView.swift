//
//  questions.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI

struct QuestionFlowView: View {
    // questjions for me
    let questions: [Question] = [
        Question(text: "Are you a serious person?", type: "ranged", answers: [
            Answer(text: "Goofball", turtle: .mikey),
            Answer(text: "All business", turtle: .leo)
        ]),
        Question(text: "Favorite weapon?", type: "single", answers: [
            Answer(text: "Katana", turtle: .leo),
            Answer(text: "Sai", turtle: .raph),
            Answer(text: "Nunchucks", turtle: .mikey),
            Answer(text: "Bo Staff", turtle: .donnie)
        ]),
        Question(text: "Pick your ninja moves:", type: "multiple", answers: [
            Answer(text: "High kick", turtle: .leo),
            Answer(text: "Power punch", turtle: .raph),
            Answer(text: "Spin attack", turtle: .mikey),
            Answer(text: "Stealth attack", turtle: .donnie)
        ]),
        Question(text: "Favorite pizza topping?", type: "single", answers: [
            Answer(text: "Cheese", turtle: .mikey),
            Answer(text: "Pepperoni", turtle: .raph),
            Answer(text: "Veggies", turtle: .donnie),
            Answer(text: "Sausage", turtle: .leo)
        ]),
        Question(text: "How brave are you?", type: "ranged", answers: [
            Answer(text: "Not brave 😅", turtle: .donnie),
            Answer(text: "Very brave 🦸‍♂️", turtle: .leo)
        ]),
        Question(text: "Which of these do you like most?", type: "multiple", answers: [
            Answer(text: "Science and gadgets", turtle: .donnie),
            Answer(text: "Pranks and jokes", turtle: .mikey),
            Answer(text: "Leadership and plans", turtle: .leo),
            Answer(text: "Action and fighting", turtle: .raph)
        ])
    ]
    
    let currentIndex: Int // which question we’re on rn
    let selectedAnswers: [Answer] // all the answers picked so far
    
    var body: some View {
        let question = questions[currentIndex] // grab the question we need to show
        
        VStack(spacing: 30) {
            Text(question.text) // show the question text
                .font(.headline)
            
            // figure out which kind of question it is and show the right view
            if question.type == "ranged" {
                // slider type question
                RangedQuestionSubview(
                    question: question,
                    currentIndex: currentIndex,
                    selectedAnswers: selectedAnswers,
                    questions: questions
                )
            } else if question.type == "single" {
                // picker wheel type question
                SingleQuestionSubview(
                    question: question,
                    currentIndex: currentIndex,
                    selectedAnswers: selectedAnswers,
                    questions: questions
                )
            } else if question.type == "multiple" {
                // checkbox type question (pick more than one)
                MultipleQuestionSubview(
                    question: question,
                    currentIndex: currentIndex,
                    selectedAnswers: selectedAnswers,
                    questions: questions
                )
            }
        }
        .padding()
    }
}
