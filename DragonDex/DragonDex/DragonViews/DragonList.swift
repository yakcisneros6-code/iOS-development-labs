//
//  DragonList.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/8/26.
//

import SwiftUI

struct DragonList: View {

    let dragons: [Dragon]

    @Environment(SettingsViewModel.self) private var settings
    @Environment(DragonRouter.self) private var router

    var body: some View {
        ZStack {
            settings.color
                .ignoresSafeArea()

            List(dragons) { dragon in
                NavigationLink(
                    value: DragonRouter.Route.dragonDetail(dragon: dragon)
                ) {
                    HStack(spacing: 12) {
                        Image(dragon.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(dragon.name)
                                .font(.headline)

                            Text(dragon.species)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(5)
                }
                .listRowBackground(settings.color)
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Dragons")
        .toolbar {
            NavigationLink(value: DragonRouter.Route.settings) {
                Text
               // Image(systemName: "gear.circle.fill")
            }
        }
    }
}

