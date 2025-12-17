//
//  DogTabview.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

struct DogTabView: View {
    @State private var currentDog: Dog? = nil
    @State private var savedDogs: [Dog] = []
    @State private var dogName: String = ""
    
    private let apiController: DogAPIControllerProtocol = DogAPIController()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                if let dog = currentDog {
                    if let url = URL(string: dog.image) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .cornerRadius(12)
                        } placeholder: {
                            ProgressView()
                                .frame(height: 250)
                        }
                    } else {
                        Text("Invalid image URL")
                            .foregroundColor(.red)
                    }
                    
                    TextField("Enter dog name", text: $dogName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button("New Image") {
                        Task {
                            if let dog = currentDog {
                                await MainActor.run {
                                    var newDog = dog
                                    newDog.name = dogName
                                    savedDogs.append(newDog)
                                }
                            }
                            
                            if let newDog = await apiController.fetchNewDog() {
                                await MainActor.run {
                                    currentDog = newDog
                                    dogName = newDog.name
                                }
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    Text("No dog loaded")
                        .foregroundColor(.gray)
                }
                
                List {
                    ForEach(savedDogs) { dog in
                        if let index = savedDogs.firstIndex(where: { $0.id == dog.id }) {
                            NavigationLink(destination: DogDetailView(dog: $savedDogs[index])) {
                                DogListCell(dog: dog)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("Dogs")
            .task {
                if let newDog = await apiController.fetchNewDog() {
                    await MainActor.run {
                        currentDog = newDog
                        dogName = newDog.name
                    }
                }
            }
        }
    }
}

struct DogTabView_Previews: PreviewProvider {
    static var previews: some View {
        DogTabView()
    }
}

