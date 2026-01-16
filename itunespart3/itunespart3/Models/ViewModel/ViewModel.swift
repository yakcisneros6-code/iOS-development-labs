//storeitemlistview model

import Foundation

@MainActor
class StoreItemListViewModel: Observable {
    var items: [StoreItem] = []
    var searchTerm: String = ""
    var mediaType: String = "music"
    
    private let controller = StoreItemController()
    
    func fetchMatchingItems() async {
        let trimmedTerm = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTerm.isEmpty else {
            items = []
            return
        }
        
        let query: [String: String] = [
            "term": trimmedTerm,
            "media": mediaType
        ]
        
        do {
            let results = try await controller.fetchItems(matching: query)
            items = results
            print("Fetched \(results.count) items")
        } catch {
            print("Error fetching items: \(error)")
            items = []
        }
    }
}



