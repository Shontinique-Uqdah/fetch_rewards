//
//  ContentViewTests.swift
//  Fetch RecipesUITests
//
//  Created by Shontinique Uqdah on 7/5/24.
//
/*
import XCTest
import SwiftUI
@testable import Fetch_Recipes

final class ContentViewTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testInitialState() {
            let view = ContentView()
            XCTAssertEqual(view.recipes.count, 0)
            XCTAssertNil(view.errorMessage)
        }

        func testLoadRecipesSuccess() async {
            let view = ContentView()
            await view.loadRecipes()
            XCTAssertFalse(view.recipes.isEmpty)
            XCTAssertNil(view.errorMessage)
        }

        func testLoadRecipesFailure() async {
            // Inject a mock RecipeService that simulates a failure
            let view = ContentView()
            RecipeService.shared = MockRecipeService(shouldFail: true)
            await view.loadRecipes()
            XCTAssertTrue(view.recipes.isEmpty)
            XCTAssertNotNil(view.errorMessage)
        }
}

// Mock RecipeService for testing
class MockRecipeService: RecipeService {
    let shouldFail: Bool

    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }

    override func fetchRecipes() async throws -> [Recipe] {
        if shouldFail {
            throw NSError(domain: "test", code: 1, userInfo: nil)
        } else {
            return [Recipe(idMeal: "1", strMeal: "Test Meal", strCategory: nil, strInstructions: nil, strArea: nil, strMealThumb: nil, strTags: nil, strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)]
        }
    }
}
*/


/*
import XCTest
@testable import Fetch_Recipes

final class ContentViewTests: XCTestCase {
    
    func testLoadRecipes() async {
        // Given
        let mockService = MockRecipeService()
        let viewModel = ContentViewModel(recipeService: mockService)
        let contentView = ContentView(viewModel: viewModel)
        
        // When
        await viewModel.loadRecipes()
        
        // Then
        XCTAssertFalse(viewModel.recipes.isEmpty, "Recipes should not be empty after loading.")
    }
    
    func testRecipeDisplayedCorrectly() async {
        // Given
        let mockService = MockRecipeService()
        let viewModel = ContentViewModel(recipeService: mockService)
        let contentView = ContentView(viewModel: viewModel)
        
        // When
        await viewModel.loadRecipes()
        
        // Then
        let recipe = viewModel.recipes.first
        XCTAssertNotNil(recipe, "First recipe should not be nil.")
        XCTAssertEqual(recipe?.strMeal, "Chocolate Cake", "The first recipe name should be Chocolate Cake.")
    }
}
*/
