//
//  EditProfileView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI
import Foundation

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var user: User
    
    @State private var username: String
    @State private var bio: String
    
    init(user: Binding<User>) {
        _user = user
        _username = State(initialValue: user.wrappedValue.username)
        _bio = State(initialValue: user.wrappedValue.bio) 
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Username")) {
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.none)
                }
                
                Section(header: Text("Bio")) {
                    TextEditor(text: $bio)
                        .frame(minHeight: 100)
                }
                
                Section {
                    Button("Save") {
                        user.username = username
                        user.bio = bio
                        dismiss()
                    }
                    .disabled(username.isEmpty)
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
