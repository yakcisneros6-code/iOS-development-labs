//
//  DragonDetail.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/8/26.
//

import SwiftUI

struct DragonDetailView: View {

    let dragon: Dragon

    @Environment(SettingsViewModel.self) private var settings
    @Environment(DragonRouter.self) private var router

    var body: some View {
        ZStack {
            settings.color
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {

                    Text(dragon.name)
                        .font(.largeTitle)
                        .bold()

                    Text(dragon.species)
                        .font(.title3)
                        .foregroundColor(.secondary)

                    Image(dragon.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .cornerRadius(12)

                    Text(dragon.lore)
                        .multilineTextAlignment(.center)
                        .padding()

                    Text("Fire Rating: \(dragon.fireRating)/10")
                        .font(.headline)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Known Weaknesses")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                //did my black capusule border thing
                                ForEach(dragon.weaknesses, id: \.self) { weakness in
                                    Text(weakness)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(Color.black.opacity(0.8))
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
//tappable view its
                    NavigationLink(
                        value: DragonRouter.Route.powers(dragon: dragon)
                    ) {
                        Text("See Dragon Powers")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .navigationTitle("Dragon Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

