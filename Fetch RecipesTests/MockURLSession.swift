//
//  MockRecipeServiceTests.swift
//  Fetch RecipesUITests
//
//  Created by Shontinique Uqdah on 7/7/24.
//

/*
import Foundation
@testable import Fetch_Recipes

class MockRecipeService: RecipeServiceProtocol {
    let shouldFail: Bool

    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }

    func fetchRecipes() async throws -> [Recipe] {
        if shouldFail {
            throw NSError(domain: "test", code: 1, userInfo: nil)
        } else {
            return [Recipe(idMeal: "1", strMeal: "Test Meal", strCategory: nil, strInstructions: nil, strArea: nil, strMealThumb: nil, strTags: nil, strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)]
        }
    }

    func fetchRecipeDetails(id: String) async throws -> Recipe {
        if shouldFail {
            throw NSError(domain: "test", code: 1, userInfo: nil)
        } else {
            return Recipe(idMeal: id, strMeal: "Test Meal", strCategory: nil, strInstructions: nil, strArea: nil, strMealThumb: nil, strTags: nil, strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
        }
    }
}
*/

/*
import Foundation
@testable import Fetch_Recipes

class MockRecipeService: RecipeServiceProtocol {
    var fetchRecipesResult: Result<[Recipe], Error>!
    var fetchRecipeDetailsResult: Result<Recipe, Error>!
    
    func fetchRecipes() async throws -> [Recipe] {
        switch fetchRecipesResult {
        case .success(let recipes):
            return recipes
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchRecipesResult is not set")
        }
    }
    
    func fetchRecipeDetails(id: String) async throws -> Recipe {
        switch fetchRecipeDetailsResult {
        case .success(let recipe):
            return recipe
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchRecipeDetailsResult is not set")
        }
    }
}

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        
        return (data ?? Data(), URLResponse())
    }
}

*/


/*
import Foundation
@testable import Fetch_Recipes

class MockRecipeService: RecipeServiceProtocol {
    var fetchRecipesResult: Result<[Recipe], Error>!
    var fetchRecipeDetailsResult: Result<Recipe, Error>!
    
    func fetchRecipes() async throws -> [Recipe] {
        switch fetchRecipesResult {
        case .success(let recipes):
            return recipes
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchRecipesResult is not set")
        }
    }
    
    func fetchRecipeDetails(id: String) async throws -> Recipe {
        switch fetchRecipeDetailsResult {
        case .success(let recipe):
            return recipe
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchRecipeDetailsResult is not set")
        }
    }
}

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        
        return (data ?? Data(), URLResponse())
    }
}
*/
import Foundation
@testable import Fetch_Recipes

import Foundation

class MockURLSession: URLSessionProtocol {
    private let data: Data?
    private let response: URLResponse?
    private let error: Error?

    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        return (data ?? Data(), response ?? URLResponse())
    }
}
