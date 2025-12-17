//
//  CountDownView.swift
//  AdvancedNavigation
//
//  Created by Yaquelin Cisneros on 12/11/25.
//
import SwiftUI
import Combine

struct CountDownView: View {
    @Binding var countdown: Int
    @Binding var gamestart: Bool
    
    var body: some View {
        Text(gamestart ? "Go!" : "\(countdown)")
            .font(.system(size: 100))
            .bold()
    }
}

