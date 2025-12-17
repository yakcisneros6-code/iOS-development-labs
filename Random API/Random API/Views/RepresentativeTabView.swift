//
//  RepresentativeTabView.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

struct RepresentativeTabView: View {
    
    @State private var zipCode: String = ""
    @State private var representatives: [Representative] = []
    private let apiController = RepresentativeAPIController()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                TextField("Enter Zip Code", text: $zipCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                
                Button("Search") {
                    Task {
                        do {
                            representatives = try await apiController.fetchRepresentatives(for: zipCode)
                        } catch {
                            print("Failed to fetch representatives:", error)
                            representatives = []
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                
                List(representatives) { rep in
                    Text(rep.name)
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("Representatives")
        }
    }
}

