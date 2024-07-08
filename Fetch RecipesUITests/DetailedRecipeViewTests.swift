//
//  DetailedRecipeViewTests.swift
//  Fetch RecipesUITests
//
//  Created by Shontinique Uqdah on 7/5/24.
//
import XCTest
import SwiftUI
@testable import Fetch_Recipes

class DetailedRecipeViewTests: XCTestCase {

    var sut: URLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
// Testing to see whether we can load a recipe within 5 seconds
    func testLoadMealDetailDataApiCallGetsHTTPStatusCode200() throws {
        // Given "Apam balik" with id=53049, the first dessert alphabetically in the database
        let urlString =
            "https://themealdb.com/api/json/v1/1/lookup.php?i=53049"
        let url = URL(string: urlString)!
        
        let promise = expectation(description: "Status code: 200")

        let dataTask = sut.dataTask(with: url) { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
        
        /*
    func testDetailedRecipeView() throws {
        // Create a mock service
        let mockService = MockRecipeService()

        // Prepare test data for a specific recipe ID
        let recipeID = "1"
        let recipe = Recipe(idMeal: recipeID, strMeal: "Mock Recipe 1", strCategory: "Dessert", strInstructions: "Instructions 1", strArea: "Area 1", strMealThumb: "mockimage1", strTags: nil, strIngredient1: "Ingredient 1", strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: "Measure 1", strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)

        // Set up the DetailedRecipeView
        let detailedRecipeView = DetailedRecipeView(recipeID: recipeID)
            .environmentObject(mockService)

        // Check if the DetailedRecipeView is properly rendering
        XCTAssertNoThrow(try detailedRecipeView.loadRecipeDetails(), "Failed to load recipe details: \(detailedRecipeView.errorMessage ?? "Unknown Error")")

        // Perform assertions on the view's rendered output
        XCTAssertEqual(detailedRecipeView.recipe?.idMeal, recipeID, "Loaded recipe ID should match expected ID")
        XCTAssertEqual(detailedRecipeView.recipe?.strMeal, "Mock Recipe 1", "Loaded recipe title should match")
    }
         */
}
