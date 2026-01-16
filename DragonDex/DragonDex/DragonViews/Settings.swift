//
//  Settings.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/8/26.
//

import SwiftUI
import Observation

struct SettingsView: View {

    @Environment(SettingsViewModel.self) private var settings

    var body: some View {
        ZStack {
            settings.color
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Choose a Color")
                    .font(.largeTitle)
                    .bold()

                Button("Blue") {
                    settings.color = .blue
                    
                }
                .foregroundColor(.black)
                
                Button("Red") {
                    settings.color = .red
                }
                .foregroundColor(.black)
                
                Button("Green") {
                    settings.color = .green
                }
                .foregroundColor(.black)
                
                Button("Orange") {
                    settings.color = .orange
                }
                .foregroundColor(.black)
                
                Button("Purple") {
                    settings.color = .purple
                }
                .foregroundColor(.black)
                
                Button("Gray") {
                    settings.color = .gray
                }
                .foregroundColor(.black)
            }
            .font(.headline)
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
