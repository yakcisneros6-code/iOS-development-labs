//
//  MainTabView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ProfileView()//shows profiles information 
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            TimelineView()//shows posts
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Timeline")
                    
                }
            
        }
    }
}
struct MainTabView_previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
