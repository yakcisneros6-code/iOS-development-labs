//
//  RepresentativeAPIController.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import Foundation


enum RepresentativeAPIError: Error {
    case invalidURL
    case dataNotFound
    case decodingError
}

struct RepresentativeResponse: Decodable {
    let results: [Representative]
}

struct Representative: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let party: String?
    let district: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case party
        case district
    }
}

class RepresentativeAPIController: RepresentativeAPIControllerProtocol {

    func fetchRepresentatives(for zipCode: String) async throws -> [Representative] {

        guard let url = URL(
            string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(zipCode)&output=json"
        ) else {
            throw RepresentativeAPIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw RepresentativeAPIError.dataNotFound
        }

        do {
            let decodedResponse = try JSONDecoder().decode(
                RepresentativeResponse.self,
                from: data
            )
            return decodedResponse.results
        } catch {
            throw RepresentativeAPIError.decodingError
        }
    }
}
