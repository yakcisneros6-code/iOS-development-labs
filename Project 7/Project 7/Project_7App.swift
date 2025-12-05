//
//  Project_7App.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI

@main
struct Project_7App: App {
    @State var users: [User] = [
        User(id: UUID(), name: "Alice", username: "alice123", bio: "iOS Developer", interests: "SwiftUI", avatarName: nil),
        User(id: UUID(), name: "Bob", username: "bob456", bio: "Tech Enthusiast", interests: "Programming", avatarName: nil)
    ]
    
    @State var posts: [Post] = []
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .onAppear {
                    if posts.isEmpty {
                        posts = [
                            Post(authorId: users[0].id, title: "Hello world", body: "This is my first post", likes: 3),
                            Post(authorId: users[1].id, title: "SwiftUI is awesome", body: "Learning Swiftui step by step", likes: 5)
                        ]
                    }
                }
        }
    }
}

