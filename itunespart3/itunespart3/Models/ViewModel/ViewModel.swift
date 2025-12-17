
import Foundation
import Combine  

@MainActor
class StoreItemListViewModel: Observable {
    var items: [StoreItem] = []
    var searchTerm: String = ""
     var mediaType: String = "music"

    func fetchItems() async {
        let trimmedTerm = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTerm.isEmpty else {
            items = []
            return
        }

        do {
            var components = URLComponents(string: "https://itunes.apple.com/search")!
                        components.queryItems = [
                            URLQueryItem(name: "term", value: trimmedTerm),
                            URLQueryItem(name: "media", value: mediaType)
                        ]

            


                        
            let (data, response) = try await URLSession.shared.data(from: components.url!)

            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw URLError(.badServerResponse)
            }


            let decoded = try JSONDecoder().decode(StoreItemResponse.self, from: data)
                        items = decoded.results
        } catch {
            print("Error fetching items: \(error)")
            items = []
        }
    }
}



