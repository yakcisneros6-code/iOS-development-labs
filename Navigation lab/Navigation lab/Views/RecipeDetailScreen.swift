//
//  RecipeDetailScreen.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.
//



import SwiftUI

struct RecipeDetailScreen: View {
   
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom)
            
            Text("Ingredients")
                .font(.headline)
            
            
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text("• \(ingredient)")
            }
            
            Spacer()
        }
        .padding()
       
        .navigationTitle(recipe.name)
    }
}
