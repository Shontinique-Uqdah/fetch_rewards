//
//  RecipeServiceTests.swift
//  Fetch RecipesTests
//
//  Created by Shontinique Uqdah on 7/5/24.
//

import XCTest
@testable import Fetch_Recipes

final class RecipeServiceTests: XCTestCase {
    var service: RecipeService!
    var mockSession: MockURLSession!

    override func setUp() {
        super.setUp()
        
        let data = """
        {
            "meals": [{
                "idMeal": "52772",
                "strMeal": "Expected Meal Name",
                "strCategory": "Dessert",
                "strInstructions": "Instructions",
                "strArea": "Area",
                "strMealThumb": "Thumbnail",
                "strTags": "Tags",
                "strIngredient1": "Ingredient1",
                "strIngredient2": "Ingredient2",
                "strMeasure1": "Measure1",
                "strMeasure2": "Measure2"
            }]
        }
        """.data(using: .utf8)
        
        mockSession = MockURLSession(data: data, response: HTTPURLResponse(url: URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!,
                                                                           statusCode: 200,
                                                                           httpVersion: nil,
                                                                           headerFields: nil),
                                     error: nil)
        service = RecipeService(session: mockSession)
    }

    override func tearDown() {
        service = nil
        mockSession = nil
        super.tearDown()
    }

    func testFetchRecipes() async throws {
        let recipes = try await service.fetchRecipes()
        XCTAssertFalse(recipes.isEmpty, "The fetched recipes should not be empty.")
        XCTAssertEqual(recipes.first?.strMeal, "Apam balik")
    }

    func testFetchRecipeDetails() async throws {
        let expectedRecipeId = "52772"
        let recipe = try await service.fetchRecipeDetails(id: expectedRecipeId)
        XCTAssertEqual(recipe.idMeal, expectedRecipeId, "The fetched recipe ID should match the expected ID.")
        XCTAssertEqual(recipe.strMeal, "Teriyaki Chicken Casserole", "The fetched recipe name should match the expected name.")
    }
}
