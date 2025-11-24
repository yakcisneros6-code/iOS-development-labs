//
//  DiscoverView.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.
//


import SwiftUI

struct DiscoverView: View {
  
    let discoveredRecipes: [Recipe] = [
        Recipe(name: "Spicy Thai Green Curry", description: "A flavorful and aromatic curry with coconut milk.", ingredients: ["Chicken", "Green Curry Paste", "Coconut Milk"]),
        Recipe(name: "Classic Chocolate Chip Cookies", description: "The perfect balance of soft centers and crispy edges.", ingredients: ["Butter", "Sugar", "Flour", "Chocolate Chips"]),
        Recipe(name: "Vegan Lentil Soup", description: "Hearty and nutritious, perfect for a cold day.", ingredients: ["Lentils", "Carrots", "Celery", "Broth"])
    ]
    
    var body: some View {
       
        NavigationStack {
            

            List {
                ForEach(discoveredRecipes) { recipe in
                
                    NavigationLink(destination: RecipeDetailScreen(recipe: recipe)) {
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.headline)
                            Text(recipe.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            .navigationTitle("Discover")
        }
    }
}
