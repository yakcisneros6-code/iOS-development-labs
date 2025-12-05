//
//  Posts.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//
import SwiftUI
import Foundation

struct PostRow: View {
    let post: Post
    let author: User
    @State private var showComments = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if let avatar = author.avatarName, !avatar.isEmpty {
                    Image(avatar)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                }

                Text(author.username)
                    .font(.headline)
            }

            Text(post.title)
                .font(.title3)
                .bold()

            Text(post.body)
                .font(.body)

            HStack {
                Button(action: {
                    showComments.toggle()
                }) {
                    Text("Comments (\(post.comments.count))")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }

                Spacer()

                Text("Likes: \(post.likes)")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .sheet(isPresented: $showComments) {
            CommentsView(post: post)
        }
    }
}


struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        let userId = UUID()
        let sampleUser = User(
            id: userId,
            name: "Yaquelin",
            username: "yaquelin",
            bio: "iOS Developer",
            interests: "SwiftUI",
            avatarName: nil
        )

        let samplePost = Post(
            authorId: userId,
            title: "Hello World",
            body: "Sample post body",
            likes: 3,
            comments: []
        )

        PostRow(post: samplePost, author: sampleUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

