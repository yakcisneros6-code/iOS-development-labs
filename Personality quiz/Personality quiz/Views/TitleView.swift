//
//  Views.swift
//  Personality quiz
//
//  Created by Yaquelin Cisneros on 11/11/25.
//


import SwiftUI

struct TitleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Text("Ninja Turtle Quiz")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    
                    Image("ninjaturtlesfront")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    // begin button and navigation to first question
                    NavigationLink("Begin") {
                        QuestionFlowView(currentIndex: 0, selectedAnswers: [])
                    }
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}
