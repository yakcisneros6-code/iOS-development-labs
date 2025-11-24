//
//  SingleQuestions.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @State var vm: ViewModel
    
    init(question: Question, currentIndex: Int, selectedAnswers: [Answer], questions: [Question], selectedIndex: Int = 0) {
        _vm = State(wrappedValue: ViewModel(question: question, currentIndex: currentIndex, selectedAnswers: selectedAnswers, questions: questions, selectedIndex: selectedIndex))
    }

    var body: some View {
        VStack(spacing: 15) {
            // this is the wheel thing you spin to pick your answer
            Picker("Pick one", selection: $vm.selectedIndex) {
                ForEach(0..<vm.question.answers.count, id: \.self) { i in
                    Text(vm.question.answers[i].text) // show each answer
                }
            }
            .pickerStyle(.wheel) // make it look like a spinning wheel

            let chosen = vm.question.answers[vm.selectedIndex] // grab the answer you picked

            // now we do the Next button
            // if there’s more questions left, go to the next question and save your choice
            if vm.currentIndex + 1 < vm.questions.count {
                NavigationLink("Next") {
                    QuestionFlowView(
                        currentIndex: vm.currentIndex + 1, // go to next question
                        selectedAnswers: vm.selectedAnswers + [chosen] // save what you picked
                    )
                }
                .padding()
                .background(Color.orange.opacity(0.3)) // make it orange-ish
                .cornerRadius(10) // round the corners, looks nicer
            } else {
                // if this was the last question, go to results screen instead
                NavigationLink("Next") {
                    ResultsView(
                        selectedAnswers: vm.selectedAnswers + [chosen] // save last answer
                    )
                }
                .padding()
                .background(Color.orange.opacity(0.3))
                .cornerRadius(10)
            }
        }
    }
}
