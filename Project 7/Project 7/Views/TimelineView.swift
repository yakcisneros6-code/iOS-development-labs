//
//  TimelineView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI

struct TimelineView: View {

    struct Post: Identifiable {
        let id = UUID()
        let username: String
        let title: String
        let body: String
        let likes: Int
        let comments: Int
    }

    let posts: [Post] = [
        Post(username: "Anastasia Black", title: "Almost finished app", body: "I am almost done with Project 7!", likes: 5, comments: 2),
        Post(username: "yaki", title: "Learning SwiftUI", body: "SwiftUI is really fun!", likes: 3, comments: 1)
    ]

    @State private var showNewPost = false

    var body: some View {
        NavigationView {
            VStack {
                Button("New Post") {
                    showNewPost = true
                }
                .padding()
                .sheet(isPresented: $showNewPost) {
                    NewPostView()
                }

                List(posts) { post in
                    TimelinePostView(post: post) // use TimelinePostView here
                        .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Timeline")
        }
    }
}


struct TimelinePostView: View {
    let post: TimelineView.Post

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(post.username)
                .font(.headline)
            Text(post.title)
                .font(.subheadline)
                .bold()
            Text(post.body)
                .font(.body)
            HStack {
                Text("Likes: \(post.likes)")
                Text("Comments: \(post.comments)")
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
//nbew post creat a a new post
// created the title and bod for me to submit the button
struct NewPostView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("New Post Form Here")
                .font(.title)
            TextField("Title", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            TextField("Body", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button("Submit") {
                // dismiss sheet
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}

//did a list to display every post
