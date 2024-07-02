//
//  DetailedRecipeView.swift
//  Fetch Recipes
//
//  Created by Shontinique Uqdah on 7/1/24.
//

import SwiftUI

struct DetailedRecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(recipe.strMeal)
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            if let category = recipe.strCategory {
                Text("Category: \(category)")
                    .font(.headline)
            }
            AsyncImage(url: URL(string: recipe.strMealThumb!)){ image in
                image.resizable()
                  .aspectRatio(contentMode: .fit) // or .fill
              } placeholder: {
                ProgressView()
              }
            
            if let instructions = recipe.strInstructions {
                Text("Instructions:")
                    .font(.headline)
                    .padding(.top, 10)
                Text(instructions)
                    .font(.body)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Recipe Details")
    }
}

#Preview {
    let sampleRecipe = Recipe(
            idMeal: "12345",
            strMeal: "Chocolate Cake",
            strCategory: "Dessert",
            strInstructions: "Mix ingredients and bake.",
            strArea: "American",
            strMealThumb: "https://www.themealdb.com/images/media/meals/qtuwxu1468233098.jpg"
        )
    return NavigationView {
        DetailedRecipeView(recipe: sampleRecipe)
    }
}
