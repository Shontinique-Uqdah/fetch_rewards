//
//  DetailedRecipeViewTests.swift
//  Fetch RecipesUITests
//
//  Created by Shontinique Uqdah on 7/5/24.
//

/*
import XCTest
import SwiftUI
@testable import Fetch_Recipes

final class DetailedRecipeViewTests: XCTestCase {

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
            let view = DetailedRecipeView(recipeID: "1")
            XCTAssertNil(view.recipe)
            XCTAssertNil(view.errorMessage)
        }

        func testLoadRecipeDetailsSuccess() async {
            let view = DetailedRecipeView(recipeID: "1")
            RecipeService.shared = MockRecipeService(shouldFail: false)
            await view.loadRecipeDetails()
            XCTAssertNotNil(view.recipe)
            XCTAssertNil(view.errorMessage)
        }

        func testLoadRecipeDetailsFailure() async {
            let view = DetailedRecipeView(recipeID: "1")
            RecipeService.shared = MockRecipeService(shouldFail: true)
            await view.loadRecipeDetails()
            XCTAssertNil(view.recipe)
            XCTAssertNotNil(view.errorMessage)
        }
}
*/


/*
import XCTest
@testable import Fetch_Recipes

final class DetailedRecipeViewTests: XCTestCase {
    
    func testLoadRecipeDetails() async {
        // Given
        let recipeID = "52772"
        let mockService = MockRecipeService()
        let viewModel = DetailedRecipeViewModel(recipeID: recipeID, recipeService: mockService)
        let detailedRecipeView = DetailedRecipeView(recipeID: recipeID, viewModel: viewModel)
        
        // When
        await viewModel.loadRecipeDetails()
        
        // Then
        XCTAssertNotNil(viewModel.recipe, "Recipe should not be nil after loading.")
        XCTAssertEqual(viewModel.recipe?.idMeal, recipeID, "Recipe ID should match the given ID.")
    }
    
    func testDisplayRecipeDetails() async {
        // Given
        let recipeID = "52772"
        let mockService = MockRecipeService()
        let viewModel = DetailedRecipeViewModel(recipeID: recipeID, recipeService: mockService)
        let detailedRecipeView = DetailedRecipeView(recipeID: recipeID, viewModel: viewModel)
        
        // When
        await viewModel.loadRecipeDetails()
        
        // Then
        let recipe = viewModel.recipe
        XCTAssertNotNil(recipe, "Recipe should not be nil after loading.")
        XCTAssertEqual(recipe?.strMeal, "Chocolate Cake", "The recipe name should be Chocolate Cake.")
        XCTAssertEqual(recipe?.strCategory, "Dessert", "The category should be Dessert.")
        XCTAssertEqual(recipe?.strArea, "American", "The area should be American.")
    }
}
*/
