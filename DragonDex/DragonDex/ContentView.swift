//
//  ContentView.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/8/26.
//

import SwiftUI

struct ContentView: View {

    @State private var router = DragonRouter()
    @State private var settings = SettingsViewModel()

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            DragonList(dragons: Dragon.sample)
                .navigationDestination(for: DragonRouter.Route.self) { route in
                    router.view(for: route)
                }
        }
        .environment(router)
        .environment(settings)
    }
}

#Preview {
    ContentView()
}
//I set up the router right inside my content view. Basically, I created a NavigationStack there and hooked it up to the router so that all the navigation paths come from one place. Then, I added the router and the settings model to the environment. That way, any screen can just ask for the router or the settings directly from the environment
