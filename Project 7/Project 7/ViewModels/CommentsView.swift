//
//  CommentsView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/24/25.
//
import SwiftUI
import Foundation

struct CommentsView: View {
    let post: Post
    @State private var newCommentText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(post.comments) { comment in
                        Text(comment.text)
                            .padding(5)
                    }
                }
                
                HStack {
                    TextField("Add a comment...", text: $newCommentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Post") {
                        print("Add comment: \(newCommentText)")
                        newCommentText = ""
                    }
                    .disabled(newCommentText.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Comments")
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        let userId = UUID()
        let samplePost = Post(
            authorId: userId,
            title: "Sample Post",
            body: "This is a sample post.",
            likes: 0,
            comments: [
                Comment(postId: UUID(), authorId: userId, text: "First comment"),
                Comment(postId: UUID(), authorId: userId, text: "Second comment")
            ]
        )
        CommentsView(post: samplePost)
    }
}
