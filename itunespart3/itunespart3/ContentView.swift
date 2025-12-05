//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $viewModel.searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    Task {
                        await viewModel.fetchItems()
                    }
                }
                .padding()

                List(viewModel.items, id: \.name) { item in
                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text(item.artist).font(.subheadline)
                        Text(item.kind).font(.caption)
                        Text(item.description).lineLimit(3).font(.body)
                    }
                }
            }
            .navigationTitle("iTunes Search")
        }
    }
}




