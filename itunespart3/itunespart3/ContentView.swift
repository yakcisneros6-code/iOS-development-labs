//
//content view

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var selectedMediaType: String = "music"
    @State private var items: [StoreItem] = []

    private let viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $selectedMediaType) {
                    Text("Music").tag("music")
                    Text("Books").tag("ebook")
                    Text("Podcasts").tag("podcast")
                    Text("Apps").tag("software")
                }
                .pickerStyle(.segmented)
                .padding()

                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
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
                .padding(.vertical)

                List(items, id: \.id) { item in
                    VStack(alignment: .leading, spacing: 8) {
                        AsyncImage(url: item.artworkURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)

                        Text(item.name)
                            .font(.headline)

                        Text(item.artist)
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(item.kind)
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text(item.description)
                            .lineLimit(3)
                            .font(.body)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("iTunes Search")
        }
    }

    private func performSearch() async {
        viewModel.searchTerm = searchText
        viewModel.mediaType = selectedMediaType
        await viewModel.fetchMatchingItems()
        items = viewModel.items
    }
}

#Preview {
    ContentView()
}
