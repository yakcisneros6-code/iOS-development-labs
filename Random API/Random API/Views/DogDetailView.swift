//
//  DogDetailView.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//
import SwiftUI

struct DogDetailView: View {
    @Binding var dog: Dog
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: dog.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }
            
            TextField("Enter dog name", text: $dog.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Edit Dog")
    }
}

