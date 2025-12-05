//
//  MainTabView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI
import Foundation

struct MainTabView: View {
    @State private var selectedTab = 0
    
    @State private var users: [User] = [
        User(id: UUID(), name: "Yaquelin Cisneros", username: "yaquelin", bio: "iOS Developer trying to be", interests: "SwiftUI", avatarName: "avatar1"),
        User(id: UUID(), name: "John Doe", username: "johndoe", bio: "Tech maybe", interests: "Programming", avatarName: "avatar2")
    ]
    
    @State private var posts: [Post] = []
    
    var body: some View {
        TabView(selection: $selectedTab) {
        
            TimelineView(posts: $posts, users: $users)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
                .tag(0)
            
            UsersView(users: users)
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Users")
                }
                .tag(1)
            
            // Pass a binding to the first user
            ProfileView(user: $users[0])
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .onAppear {
            if posts.isEmpty {
                let firstUserId = users[0].id
                posts = [
                    Post(authorId: firstUserId, title: "Hello SwiftUI", body: "This is my first post", likes: 5, comments: []),
                    Post(authorId: firstUserId, title: "Another Post", body: "Learning SwiftUI", likes: 2, comments: [])
                ]
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
