//



import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = StoreItemListViewModel()

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
                        
                        
                        AsyncImage(url: item.artworkURL) { image in
                            image
                                .resizable()
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
}



