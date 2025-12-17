//
//  DogAPIController.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//
import Foundation

class DogAPIController: DogAPIControllerProtocol {

    enum DogAPIError: Error {
        case invalidURL
        case invalidResponse
        case imageNotFound
        case decodingFailed
    }

    func fetchRandomDogImage() async throws -> String {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            throw DogAPIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DogAPIError.invalidResponse
        }

        let decoded = try JSONDecoder().decode(DogAPIResponse.self, from: data)
        guard !decoded.message.isEmpty else {
            throw DogAPIError.imageNotFound
        }
        return decoded.message
    }

    func fetchNewDog() async -> Dog? {
        do {
            let imageUrl = try await fetchRandomDogImage()
            return Dog(image: imageUrl)
        } catch {
            print("Error fetching dog image:", error)
            return nil
        }
    }
}
