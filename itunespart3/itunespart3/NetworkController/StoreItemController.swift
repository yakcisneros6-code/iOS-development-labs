
//  StoreItemController.swift
//  itunespart3
//
//  Created by Yaquelin Cisneros on 12/3/25.

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components?.url
    }
}

enum StoreItemError: Error {
    case itemsNotFound
}

struct SearchResponse: Decodable {
    let results: [StoreItem]
}


func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    guard let url = URL(string: "https://itunes.apple.com/search")?.withQueries(query) else {
        throw StoreItemError.itemsNotFound
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
    }

    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
    return searchResponse.results
}
