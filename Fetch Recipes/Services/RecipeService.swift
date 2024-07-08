//
//  RecipeService.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 7/5/24.
//

// Layer for handling REST API calls
import Foundation

struct Wrapper: Codable {
    let meals: [Recipe]
}

// Struct for deserializing the JSON format of the RESTful API calls
struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strInstructions: String?
    let strArea: String?
    let strMealThumb: String?
    let strTags: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    var id: String {
        idMeal
    }
}

protocol RecipeServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]
    func fetchRecipeDetails(id: String) async throws -> Recipe
}

class RecipeService: RecipeServiceProtocol, ObservableObject {
    static let shared = RecipeService()
    private var session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    // Method to retrieve a list of all recipes in the category "Dessert"
    func fetchRecipes() async throws -> [Recipe] {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper.meals
    }

    // Method to retrieve full details for a recipe given its ID
    func fetchRecipeDetails(id: String) async throws -> Recipe {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper.meals[0]
    }
}
