//
//  Users.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//
import SwiftUI
import Foundation

struct UsersView: View {
    let users: [User]
    
    var body: some View {
        List(users) { user in
            HStack {
                if let avatar = user.avatarName, !avatar.isEmpty {
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
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.headline)
                    
                    if !user.bio.isEmpty {  
                        Text(user.bio)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(5)
        }
        .navigationTitle("Users")
    }
}

