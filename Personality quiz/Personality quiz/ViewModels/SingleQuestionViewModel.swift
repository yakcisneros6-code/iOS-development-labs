//
//  SingleQuestionViewModel.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/18/25.
//
import Observation

extension SingleQuestionSubview {
    @Observable
    class ViewModel {
        let question: Question // this is the question we’re showing right now
        let currentIndex: Int // which question number we’re on
        let selectedAnswers: [Answer] // all the answers picked so far
        let questions: [Question] // all the questions in the quiz
        
        var selectedIndex = 0 // which answer you’ve picked
        
        
        init(question: Question, currentIndex: Int, selectedAnswers: [Answer], questions: [Question], selectedIndex: Int = 0) {
            self.question = question
            self.currentIndex = currentIndex
            self.selectedAnswers = selectedAnswers
            self.questions = questions
            self.selectedIndex = selectedIndex
        }
    }
}
