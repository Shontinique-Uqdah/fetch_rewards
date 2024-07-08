//
//  Fetch_RecipesApp.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 6/29/24.
//

import SwiftUI

@main
struct Fetch_RecipesApp: App {
    let recipeService: RecipeService = RecipeService.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeService)  // Inject RecipeService as environment object
        }
    }
}
