//
//  DetailedRecipeView.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 7/1/24.
//

/*
 import SwiftUI

struct DetailedRecipeView: View {
    let recipeId: String
    let recipe: Recipe
    @State private var errorMessage: String?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(recipe.strMeal)
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            if let category = recipeDetails.strCategory {
                Text("Category: \(category)")
                    .font(.headline)
            }
            AsyncImage(url: URL(string: recipeDetails.strMealThumb!)){ image in
                image.resizable()
                  .aspectRatio(contentMode: .fit) // or .fill
              } placeholder: {
                ProgressView()
              }
            
            if let instructions = recipeDetails.strInstructions {
                Text("Instructions:")
                    .font(.headline)
                    .padding(.top, 10)
                Text(instructions)
                    .font(.body)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Recipe Details")
        .task {
            await loadRecipe(id: recipeId)
        }
    }
    
    func loadRecipe(id: String) async {
            do {
                recipe = try await fetchRecipeDetails(id: id)
            } catch {
                errorMessage = "Failed to load recipe: \(error.localizedDescription)"
            }
        }
    
    func fetchRecipeDetails(id: String) async throws -> Recipe {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper.meals[0]
    }
}

/*
 #Preview {
    let sampleRecipe = Recipe(
            idMeal: "12345",
            strMeal: "Chocolate Cake",
            strCategory: "Dessert",
            strInstructions: "Mix ingredients and bake.",
            strArea: "American",
            strMealThumb: "https://www.themealdb.com/images/media/meals/qtuwxu1468233098.jpg"
        )
    return NavigationView {
        DetailedRecipeView(recipe: sampleRecipe)
    }
}
*/

#Preview {
    NavigationView {
        DetailedRecipeView(recipeID: "5")
    }
}
*/

/*
import SwiftUI

struct DetailedRecipeView: View {
    let recipeID: String
    @State private var recipe: Recipe?
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let recipe = recipe {
                Text(recipe.strMeal)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                if let previewImage = recipe.strMealThumb {
                    AsyncImage(url: URL(string: previewImage)){ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit) // or .fill
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                if let category = recipe.strCategory {
                    Text("Category: \(category)")
                        .font(.headline)
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

    func loadRecipeDetails() async {
        do {
            recipe = try await RecipeService.shared.fetchRecipeDetails(id: recipeID)
        } catch {
            errorMessage = "Failed to load recipe details: \(error.localizedDescription)"
        }
    }
}

#Preview {
    NavigationView {
        DetailedRecipeView(recipeID: "52772")
    }
}
*/

import SwiftUI

struct DetailedRecipeView: View {
    let recipeID: String
    @State private var recipe: Recipe?
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let recipe = recipe {
                Text(recipe.strMeal)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                if let previewImage = recipe.strMealThumb {
                    AsyncImage(url: URL(string: previewImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
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
                                Image(systemName: "checkmark.square")
                                Text(ingredient)
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
    
    func loadRecipeDetails() async {
        do {
            recipe = try await RecipeService.shared.fetchRecipeDetails(id: recipeID)
        } catch {
            errorMessage = "Failed to load recipe details: \(error.localizedDescription)"
        }
    }
    
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
