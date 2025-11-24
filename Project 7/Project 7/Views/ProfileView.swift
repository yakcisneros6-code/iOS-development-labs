//
//  ProfileView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//
import SwiftUI

struct ProfileView: View {
    
    @State private var showEditProfile = false
    
    
    let recentPost = Post(
        userId: UUID(),
        title: "Almost finished app",
        body: "I am almost done with Project 7",
        likesCount: 12,
        commentsCount: 3
    )


    let gradient = Gradient(colors: [.blue, .purple])
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.pink.opacity(0.2))
                .frame(height: 120)
                .ignoresSafeArea(edges: .top)
            
            HStack(alignment: .top, spacing: 20) {
                VStack {
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fill) // fixed typo here
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                        .padding(.top, 44)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Anastasia Black")
                            .font(.title2)
                            .foregroundColor(.white)
                        Text("Bio")
                            .foregroundColor(.white)
                        Text("Interests")
                            .foregroundColor(.white)
                        
                        Text("@sista")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.white)
                        
                        Button("Edit Profile") {
                            showEditProfile = true
                        }
                        .sheet(isPresented: $showEditProfile) {
                            EditProfileView()
                        }
                    }
                }
                
                Spacer()
            }
            .background(
                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }
}
