//
//  AddRecipeSheet.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.
//



import SwiftUI

struct AddRecipeSheet: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        NavigationStack {
            VStack {
                Text("New Recipe Form Goes Here")
                    .font(.title2)
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add New Recipe")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss() 
                    }
                }
            }
        }
    }
}
