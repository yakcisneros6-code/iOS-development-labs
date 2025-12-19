//
//  CountDownView.swift
//  AdvancedNavigation
//
//  Created by Yaquelin Cisneros on 12/11/25.
//
import SwiftUI

struct CountDownView: View {
    @Binding var countdown: Int
    @Binding var gamestart: Bool
    @State private var scale: CGFloat = 2.0
    @State private var opacity: Double = 0.0
    @State private var showGo = false
    
    var body: some View {
        ZStack {
            if !showGo {
                Text("\(countdown)")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundColor(.purple)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onChange(of: countdown) { _, _ in
                        animateNumber()
                    }
            } else {
                Text("GO!")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundColor(.pink)
                    .transition(.opacity)
            }
        }
        .onChange(of: gamestart) { _, started in
            if started {
                withAnimation(.easeIn(duration: 0.5)) {
                    showGo = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        showGo = false
                    }
                }
            }
        }
    }
    
    private func animateNumber() {
        scale = 2.0
        opacity = 0.0
        
        withAnimation(.easeOut(duration: 0.4)) {
            scale = 1.0
            opacity = 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeIn(duration: 0.4)) {
                opacity = 0.0
            }
        }
    }
}


