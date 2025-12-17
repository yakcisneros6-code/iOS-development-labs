//
//  RepresentativeViewModel.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

@MainActor
class RepresentativeViewModel {
    var representatives: [Representative] = []
    var zipCode: String = ""
    
    private let apiController: RepresentativeAPIControllerProtocol
    
    init(apiController: RepresentativeAPIControllerProtocol) {
        self.apiController = apiController
    }
    
    func fetchRepresentatives() async {
        guard !zipCode.isEmpty else {
            representatives = []
            return
        }
        
        do {
            representatives = try await apiController.fetchRepresentatives(for: zipCode)
        } catch {
            print("Failed to fetch representatives:", error)
            representatives = []
        }
    }
}

struct RepresentativeView: View {
    @State private var representatives: [Representative] = []
    @State private var zipCode: String = ""
    
    private let apiController = RepresentativeAPIController()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter ZIP code", text: $zipCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
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
                .padding()
                
                if representatives.isEmpty {
                    Spacer()
                    Text("No representatives found.")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List(representatives) { rep in
                        Text(rep.name)
                    }
                }
            }
            .navigationTitle("Representatives")
        }
    }
}

struct RepresentativeView_Previews: PreviewProvider {
    static var previews: some View {
        RepresentativeView()
    }
}


