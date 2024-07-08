//
//  DetailedRecipeView.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 7/1/24.
//

import SwiftUI

// Detailed view of recipe
struct DetailedRecipeView: View {
    let recipeID: String
    @State private var recipe: Recipe?
    @State private var errorMessage: String?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let recipe = recipe {
                    Text(recipe.strMeal)
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    
                    if let previewImage = recipe.strMealThumb {
                        AsyncImage(url: URL(string: previewImage)) {
                            image in image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    if let category = recipe.strCategory {
                        Text("Category: \(category)")
                            .font(.headline)
                    }
                    
                    if let area = recipe.strArea {
                        Text("Area: \(area)")
                            .font(.headline)
                    }
                    
                    if let tags = recipe.strTags?.split(separator: ",").map(String.init) {
                        HStack {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag)
                                    .padding(5)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                    }
                    
                    if let ingredients = getIngredients(recipe: recipe) {
                        VStack(alignment: .leading) {
                            Text("Ingredients:")
                                .font(.headline)
                            ForEach(ingredients, id: \.self) { ingredient in
                                HStack {
                                    Text("•") // Bullet point
                                    Text(ingredient.capitalized)
                                }
                            }
                        }
                    }
                    
                    if let instructions = recipe.strInstructions {
                        Text("Instructions:")
                            .font(.headline)
                            .padding(.top, 10)
                        Text(instructions)
                            .font(.body)
                    }
                    
                    Spacer()
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
            .navigationTitle("Recipe Details")
            .task {
                await loadRecipeDetails()
            }
        }
    }
    func loadRecipeDetails() async {
        do {
            recipe = try await RecipeService.shared.fetchRecipeDetails(id: recipeID)
        } catch {
            errorMessage = "Failed to load recipe details: \(error.localizedDescription)"
        }
    }
    // Get ingredients and corresponding measurements
    func getIngredients(recipe: Recipe) -> [String]? {
        var ingredients: [String] = []
        
        let mirror = Mirror(reflecting: recipe)
        for i in 1...20 {
            if let ingredient = mirror.descendant("strIngredient\(i)") as? String, !ingredient.isEmpty,
               let measure = mirror.descendant("strMeasure\(i)") as? String, !measure.isEmpty {
                ingredients.append("\(ingredient): \(measure)")
            }
        }
        
        return ingredients.isEmpty ? nil : ingredients
    }
}

#Preview {
    NavigationView {
        DetailedRecipeView(recipeID: "52772")
    }
}
