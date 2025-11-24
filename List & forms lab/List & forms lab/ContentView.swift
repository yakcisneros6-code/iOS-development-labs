//
//  ContentView.swift
//  List & forms lab
//
//  Created by Yaquelin Cisneros on 10/7/25.
//
//Build an app that has two views
//First view is a list of Somethings (Students, Cars, Movies etc.)
//Each List row should show at least 3 things
// (Name, Id number, Classes) or (Make, Model, Miles) etc.
//Second view is a detail view where you can edit the selected object
//Use a Form to allow the user to edit each property (a textfield to edit a student’s name)
//Black Diamond:
//Add ability to create a new something
//Add swipe to delete, and reordering of rows.


import SwiftUI


struct BeautyItem: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var brand: String
    var skinTone: String = ""
    var shade: String = ""
}


struct BeautyListView: View {
    @State private var beautyItems = [
        BeautyItem(name: "Foundation", category: "Face", brand: "Brand A"),
        BeautyItem(name: "Concealer", category: "Face", brand: "Brand B"),
        BeautyItem(name: "Mascara", category: "Eyes", brand: "Brand C")
    ]
    
    var body: some View {
        NavigationView {
            List($beautyItems) { $item in
                NavigationLink(destination: BeautyDetailView(item: $item)) {
                    VStack(alignment: .leading) {
                        Text("Name: \(item.name)")
                        Text("Category: \(item.category)")
                        Text("Brand: \(item.brand)")
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Beauty Items")
        }
    }
}


struct BeautyDetailView: View {
    @Binding var item: BeautyItem
    
    var body: some View {
        Form {
            Section(header: Text("Product Info")) {
                TextField("Name", text: $item.name)
                TextField("Category", text: $item.category)
                TextField("Brand", text: $item.brand)
            }
            
            Section(header: Text("Customization")) {
                TextField("Skin Tone", text: $item.skinTone)
                TextField("Shade", text: $item.shade)
            }
        }
        .navigationTitle(item.name)
    }
}



struct BeautyApp: App {
    var body: some Scene {
        WindowGroup {
            BeautyListView()
        }
    }
}
#Preview {
    
}





//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//
