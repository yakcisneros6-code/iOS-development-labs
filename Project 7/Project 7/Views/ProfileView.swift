//
//  ProfileView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//
import SwiftUI
import Foundation

struct ProfileView: View {
    @Binding var user: User
    @State private var showingEditSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                
                ZStack {
                    
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.purple.opacity(0.7), Color.purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 130, height: 130)
                    
                    
                    if let avatar = user.avatarName, !avatar.isEmpty {
                        Image("Image")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.white)
                    }
                }
                
                // Username
                Text(user.username)
                    .font(.largeTitle)
                    .bold()
                
                
                if !user.bio.isEmpty {
                    Text(user.bio)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .toolbar {
                Button("Edit") {
                    showingEditSheet = true
                }
            }
            .sheet(isPresented: $showingEditSheet) {
                EditProfileView(user: $user)
            }
        }
    }
}
