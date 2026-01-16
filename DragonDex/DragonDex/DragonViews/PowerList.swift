//
//  PowerList.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/8/26.
//

import SwiftUI

struct PowerList: View {

    let dragon: Dragon

    @Environment(SettingsViewModel.self) private var settings

    var body: some View {
        ZStack {
            settings.color
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("\(dragon.name) Powers")
                    .font(.largeTitle)
                    .bold()

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(dragon.abilities, id: \.self) { power in
                            Text(power)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
        .navigationTitle("Powers")
        .navigationBarTitleDisplayMode(.inline)
    }
}
