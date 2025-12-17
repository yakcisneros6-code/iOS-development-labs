//
//  DogViewModel.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

import Combine

@MainActor
class DogViewModel: Observable {
    
    
     var currentDog: Dog?
    var savedDogs: [Dog] = []
    
    
    private let apiController: DogAPIControllerProtocol
    
    
    init(apiController: DogAPIControllerProtocol) {
        self.apiController = apiController
    }
    
    
    func fetchNewDog() async {
        do {
            let imageUrl = try await apiController.fetchRandomDogImage()
            
            
            if let current = currentDog {
                savedDogs.insert(current, at: 0)
            }
            
            
            currentDog = Dog(name: "", image: imageUrl)
            
        } catch {
            print("Failed to fetch dog image: \(error)")
        }
    }
    
   
    func updateDog(_ dog: Dog, with newName: String) {
        
        if let index = savedDogs.firstIndex(where: { $0.id == dog.id }) {
            savedDogs[index].name = newName
        }
        
        
        if currentDog?.id == dog.id {
            currentDog?.name = newName
        }
    }
}

