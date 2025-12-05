
import Foundation
import Combine  

@MainActor
class StoreItemListViewModel: ObservableObject {
    @Published var items: [StoreItem] = []
    @Published var searchTerm: String = ""
    @Published var mediaType: String = "music"

    func loadItems() async {  // renamed to avoid conflict
        let trimmedTerm = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTerm.isEmpty else {
            items = []
            return
        }

        do {
            let fetchedItems = try await fetchItems(
                matching: ["term": trimmedTerm,
                           "media": mediaType]
            )
            items = fetchedItems
        } catch {
            print("Error fetching items: \(error)")
            items = []
        }
    }
}



