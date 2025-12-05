//
//  TimelineView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI
import Foundation

struct TimelineView: View {
    @Binding var posts: [Post]
    @Binding var users: [User]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    let sortedPosts = posts.sorted { $0.id > $1.id }

                    ForEach(sortedPosts) { post in
                        if let author = users.first(where: { $0.id == post.authorId }) {
                            PostRow(post: post, author: author)
                        }
                    }

                        }
                    }
            .padding(.vertical)
        }
        .navigationTitle("Timeline")
    }
}


