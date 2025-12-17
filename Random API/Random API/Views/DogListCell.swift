//
//  DogListCell.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

struct DogListCell: View {
    
    let dog: Dog
    
    var body: some View {
        HStack(spacing: 15) {
           
            AsyncImage(url: URL(string: dog.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 60, height: 60)
            }
            
            Text(dog.name.isEmpty ? "Unnamed Dog" : dog.name)
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

