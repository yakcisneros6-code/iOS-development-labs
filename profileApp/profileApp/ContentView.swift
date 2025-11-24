//
//  ContentView.swift
//  profileApp
//
//  Created by Yaquelin Cisneros on 10/6/25.
//

import SwiftUI

struct ContentView: View {
    
    let hobbies: [String] = ["Reading", "Hiking", "Cooking", "Traveling"]

    var body: some View {
        ZStack {
            Color(.systemGray6).ignoresSafeArea()

            ZStack {
                VStack(spacing: 20) {
                    
                    
                    HStack(spacing: 15) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("John Doe")
                                .font(.title2)
                                .bold()
                            Text("iOS Developer")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    
                    HStack(alignment: .top, spacing: 10) {
                        Text("Hobbies:")
                            .bold()
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(hobbies, id: \.self) { hobby in
                                Text(hobby)
                                    .padding(5)
                                    .background(Color.blue.opacity(0.2))
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About Me")
                            .font(.headline)
                        Text("not much")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
