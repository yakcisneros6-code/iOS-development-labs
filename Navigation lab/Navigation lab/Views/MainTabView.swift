//
//  MainTabVew.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            MyRecipesScreen()
                .tabItem {
                    Label("My Recipes", systemImage: "list.bullet")
                }

            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
        }
    }
}
