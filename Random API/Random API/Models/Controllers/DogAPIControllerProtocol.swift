//
//  DogAPIControllerProtocol.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import Foundation

protocol DogAPIControllerProtocol {
    
    func fetchRandomDogImage() async throws -> String
    func fetchNewDog() async -> Dog?
}
