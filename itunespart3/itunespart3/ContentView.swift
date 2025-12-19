//
//content view

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var items: [StoreItem] = []
    
    private let viewModel = StoreItemListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .submitLabel(.search)
                    .onSubmit {
                        Task {
                            await performSearch()
                        }
                    }
                
                Button("Search") {
                    Task {
                        await performSearch()
                    }
                }
                .padding()
                
                List(items, id: \.id) { item in
                    VStack(alignment: .leading) {
                        AsyncImage(url: item.artworkURL) { image in
                            image.resizable()
                                 .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        
                        Text(item.name).font(.headline)
                        Text(item.artist).font(.subheadline)
                        Text(item.kind).font(.caption)
                        Text(item.description).lineLimit(3).font(.body)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("iTunes Search")
        }
    }
    
    private func performSearch() async {
        viewModel.searchTerm = searchText
        await viewModel.fetchMatchingItems()
        items = viewModel.items
    }
}
