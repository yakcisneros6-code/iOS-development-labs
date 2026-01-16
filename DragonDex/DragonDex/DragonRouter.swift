//
//  DragonRouter.swift
//  DragonDex
//
//  Created by Yaquelin Cisneros on 1/12/26.
//

import SwiftUI
import Observation

@Observable
class DragonRouter {

    var navigationPath = NavigationPath()

    enum Route: Hashable {
        case dragonDetail(dragon: Dragon)
        case powers(dragon: Dragon)
        case settings
    }

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .dragonDetail(let dragon):
            DragonDetailView(dragon: dragon)
        case .powers(let dragon):
            PowerList(dragon: dragon)
        case .settings:
            SettingsView()
        }
    }
}
