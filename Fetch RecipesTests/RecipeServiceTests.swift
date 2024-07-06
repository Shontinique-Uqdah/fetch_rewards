//
//  RecipeServiceTests.swift
//  Fetch RecipesTests
//
//  Created by Shontinique Uqdah on 7/5/24.
//

import XCTest
@testable import Fetch_Recipes

final class RecipeServiceTests: XCTestCase {
    var recipeService: RecipeService!

    override func setUpWithError() throws {
        recipeService = RecipeService.shared
    }

    override func tearDownWithError() throws {
        recipeService = nil
    }

    func testFetchRecipesSuccess() async throws {
        let mockSession = URLSessionMock()
        mockSession.data = """
        {
            "meals": [
                {
                    "idMeal": "1234",
                    "strMeal": "Test Meal",
                    "strCategory": "Test Category",
                    "strInstructions": "Test Instructions",
                    "strArea": "Test Area",
                    "strMealThumb": "https://www.example.com/image.jpg",
                    "strTags": "Test,Recipe",
                    "strIngredient1": "Ingredient 1",
                    "strMeasure1": "1 cup"
                }
            ]
        }
        """.data(using: .utf8)!
        recipeService.urlSession = mockSession

        let recipes = try await recipeService.fetchRecipes()
        XCTAssertEqual(recipes.count, 1)
        XCTAssertEqual(recipes.first?.idMeal, "1234")
        XCTAssertEqual(recipes.first?.strMeal, "Test Meal")
    }

    func testFetchRecipesFailure() async {
        let mockSession = URLSessionMock()
        mockSession.error = NSError(domain: "test", code: 1, userInfo: nil)
        recipeService.urlSession = mockSession

        do {
            _ = try await recipeService.fetchRecipes()
            XCTFail("Expected fetchRecipes to throw an error")
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFetchRecipeDetailsSuccess() async throws {
        let mockSession = URLSessionMock()
        mockSession.data = """
        {
            "meals": [
                {
                    "idMeal": "1234",
                    "strMeal": "Test Meal",
                    "strCategory": "Test Category",
                    "strInstructions": "Test Instructions",
                    "strArea": "Test Area",
                    "strMealThumb": "https://www.example.com/image.jpg",
                    "strTags": "Test,Recipe",
                    "strIngredient1": "Ingredient 1",
                    "strMeasure1": "1 cup"
                }
            ]
        }
        """.data(using: .utf8)!
        recipeService.urlSession = mockSession

        let recipe = try await recipeService.fetchRecipeDetails(id: "1234")
        XCTAssertEqual(recipe.idMeal, "1234")
        XCTAssertEqual(recipe.strMeal, "Test Meal")
    }

    func testFetchRecipeDetailsFailure() async {
        let mockSession = URLSessionMock()
        mockSession.error = NSError(domain: "test", code: 1, userInfo: nil)
        recipeService.urlSession = mockSession

        do {
            _ = try await recipeService.fetchRecipeDetails(id: "1234")
            XCTFail("Expected fetchRecipeDetails to throw an error")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

// Mock URLSession for testing
class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var error: Error?

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        let response = URLResponse(url: url, mimeType: nil, expectedContentLength: data?.count ?? 0, textEncodingName: nil)
        return (data ?? Data(), response)
    }
}
