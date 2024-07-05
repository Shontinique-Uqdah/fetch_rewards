import SwiftUI

struct ContentView: View {
    @State private var recipes: [Recipe] = []
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else if recipes.isEmpty {
                    Text("No data available")
                } else {
                    List(recipes) { recipe in
                        NavigationLink(destination: DetailedRecipeView(recipeID: recipe.idMeal)) {
                            VStack(alignment: .leading) {
                                Text(recipe.strMeal)
                                    .font(.title)
                                if let previewImage = recipe.strMealThumb {
                                    AsyncImage(url: URL(string: previewImage + "/preview")){ image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit) // or .fill
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(20.0)
            .navigationTitle("Fetch Recipes")
            .task {
                await loadRecipes()
            }
        }
    }

    func loadRecipes() async {
        do {
            recipes = try await RecipeService.shared.fetchRecipes()
        } catch {
            errorMessage = "Failed to load recipes: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}

