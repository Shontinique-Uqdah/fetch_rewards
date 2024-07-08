//
//  MockRecipeService.swift
//  Fetch RecipesUITests
//
//  Created by Shontinique Uqdah on 7/7/24.
//
// MockRecipeService.swift

/*
import Foundation
import SwiftUI
@testable import Fetch_Recipes

class MockRecipeService: RecipeService  {
    // Simulated data
    static let mockRecipes: [Recipe] = [
        Recipe(idMeal: "1", strMeal: "Mock Recipe 1", strCategory: "Dessert", strInstructions: "Mock instructions", strArea: "Mock area", strMealThumb: nil, strTags: nil, strIngredient1: "Ingredient 1", strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "Measure 1", strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil),
        Recipe(idMeal: "2", strMeal: "Mock Recipe 2", strCategory: "Dessert", strInstructions: "Mock instructions", strArea: "Mock area", strMealThumb: nil, strTags: nil, strIngredient1: "Ingredient 1", strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "Measure 1", strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
    ]

    override func fetchRecipes() async throws -> [Recipe] {
        // Simulate asynchronous behavior
        return MockRecipeService.mockRecipes
    }

    override func fetchRecipeDetails(id: String) async throws -> Recipe {
        // Simulate asynchronous behavior
        guard let recipe = MockRecipeService.mockRecipes.first(where: { $0.idMeal == id }) else {
            throw NSError(domain: "MockRecipeService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Recipe not found"])
        }
        return recipe
    }
}

*/
