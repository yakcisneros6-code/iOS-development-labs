//
//  Posts.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    let author: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Image(systemName: author.avatarName ?? "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    
                    Text(post.title).font(.headline)
                    Text("@\(author.username)").font(.subheadline).foregroundStyle(.gray)
                }
            }
            
            Text(post.body)
                .font(.body)
            
            HStack {
                
                
                Label("\(post.likesCount)", systemImage: "hand.thumbsup.fill")
                    .foregroundStyle(.blue)
                
                Spacer()
                
                Label("\(post.commentsCount)", systemImage: "text.bubble.fill")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(Color("structurePink"))

        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
    

