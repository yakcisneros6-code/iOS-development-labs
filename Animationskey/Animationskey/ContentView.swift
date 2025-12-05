//
//  ContentView.swift
//  Animationskey
//
//  Created by Yaquelin Cisneros on 12/5/25.
//

import SwiftUI

@Observable
class ContentViewModel {
    var spinWorldImage = true
    var hideWorld = true
    
    var degrees: Double {
        spinWorldImage ? 0 : -180
    }
    
    var worldScale: Double {
        spinWorldImage ? 0.5 : 1.0
    }
}

struct ContentView: View {
    var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            // Rotating and scaling globe
            Image(systemName: "globe")
                .resizable()
                .foregroundStyle(.tint)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(viewModel.degrees))
                .scaleEffect(CGSize(width: viewModel.worldScale,
                                    height: viewModel.worldScale))
                .opacity(viewModel.hideWorld ? 0.05 : 1.0)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1.5)) {
                        viewModel.spinWorldImage.toggle()
                        viewModel.hideWorld.toggle()
                    }
                }
            
            // Swapping texts
            ZStack {
                Text("Hello world")
                    .offset(x: viewModel.hideWorld ? -300 : 0)
                Text("Goodbye, world")
                    .offset(x: viewModel.hideWorld ? 0 : 300)
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: viewModel.hideWorld)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
