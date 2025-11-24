//
//  MyRecipesScreen.swift
//  Navigation lab
//
//  Created by Yaquelin Cisneros on 11/23/25.
//



import SwiftUI

struct MyRecipesScreen: View {
    
    @State private var showingAddRecipe = false
    
    let myRecipes: [Recipe] = [
        Recipe(name: "My Favorite Omelette", description: "Quick and fluffy breakfast staple.", ingredients: ["Eggs", "Milk", "Cheese"]),
        Recipe(name: "Sunday Roast Chicken", description: "Perfectly seasoned and slow-roasted.", ingredients: ["Whole Chicken", "Potatoes", "Rosemary"]),
        Recipe(name: "Grandma's Apple Pie", description: "A classic dessert recipe.", ingredients: ["Apples", "Pie Crust", "Cinnamon"])
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(myRecipes) { recipe in
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
            .navigationTitle("My Recipes")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingAddRecipe = true
                    }, label: {
                        Label("Add", systemImage: "plus")
                    })
                }
            }
        }
        
        .sheet(isPresented: $showingAddRecipe) {
            AddRecipeSheet()
        }
    }
}
