//
//  ContentView.swift
//  Meet my family project 4
//
//  Created by Yaquelin Cisneros on 10/13/25.
//

import SwiftUI

struct FamilyTree: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var bio: String = ""
    var isSeen: Bool = false
}

struct FamilyListView: View {
    @State private var familyTree = [
        FamilyTree(name: "Junior", imageName: "junior", bio: "Junior loves soccer and video games."),
        FamilyTree(name: "Zamadhi", imageName: "zamadhi", bio: "Zamadhi enjoys painting and singing."),
        FamilyTree(name: "Isaac", imageName: "isaac", bio: "Issac loves doing math and ninja turtles."),
        FamilyTree(name: "Iker", imageName: "iker", bio: "Iker loves dinosaurs and snacks.")
    ]
    
    @State private var selectedMember: FamilyTree? = nil
    
    var body: some View {
        NavigationView {
            List($familyTree) { $tree in
                Button {
                    selectedMember = tree
                    if let index = familyTree.firstIndex(where: { $0.id == tree.id }) {
                        familyTree[index].isSeen = true
                    }
                } label: {
                    HStack {
                        Text(tree.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Spacer()
       //my checkmarks :)
                        if tree.isSeen {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                        
                        Image(tree.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1))
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("My Family")
            .sheet(item: $selectedMember) { member in
                if let index = familyTree.firstIndex(where: { $0.id == member.id }) {
                    FamilyDetailView(tree: $familyTree[index])
                }
            }
        }
    }
}

struct FamilyDetailView: View {
    @Binding var tree: FamilyTree
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(tree.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 11)
                    .padding(.top)
                
                TextField("Name", text: $tree.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Bio:")
                        .font(.headline)
                    TextEditor(text: $tree.bio)
                        .frame(height: 120)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle(tree.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FamilyListView()
}





