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
}
