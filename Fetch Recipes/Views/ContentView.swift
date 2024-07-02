//
//  ContentView.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 6/29/24.
//

import SwiftUI

struct Wrapper: Codable {
    let meals: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strInstructions: String?
    let strArea: String?
    let strMealThumb: String?
    
    var id: String {
            idMeal
        }
}

struct ContentView: View {
    @State private var recipes: [Recipe] = []
    @State private var errorMessage: String?
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if recipes.isEmpty {
                    Text("No data available")
                } else {
                    List(recipes) { recipe in
                        NavigationLink(destination: DetailedRecipeView(recipe: recipe)){
                            VStack(alignment: .leading) {
                                Text(recipe.strMeal)
                                    .font(.title)
                            }
                        }
                    }
                }
            }
            .padding(20.0)
            .navigationTitle("Fetch Recipes")
            .task {
                await loadRecipes()
            }
        }
    }
    
    func loadRecipes() async {
            do {
                recipes = try await performAPICall()
            } catch {
                errorMessage = "Failed to load recipes: \(error.localizedDescription)"
            }
        }
    
    func performAPICall() async throws -> [Recipe] {
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
            
            var detailedRecipes: [Recipe] = []
            for recipe in wrapper.meals {
                if let detailedRecipe = try? await fetchRecipeDetails(id: recipe.idMeal) {
                    detailedRecipes.append(detailedRecipe)
                }
            }
            return detailedRecipes
        }
        
        func fetchRecipeDetails(id: String) async throws -> Recipe {
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
            return wrapper.meals[0]
        }
        /*
        func performAPICall() async throws -> [Recipe] {
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
            return wrapper.meals
        }
         */
    }

#Preview {
    ContentView()
}
