import SwiftUI

struct RecipeDetailsView: View {
    var recipe: String
    private var ingredients: [String]
    private var steps: [String]

    init(recipe: String) {
        self.recipe = recipe
        (self.ingredients, self.steps) = RecipeDetailsView.getRecipeDetails(for: recipe)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe Title
                Text(recipe)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.horizontal, 30)

                // Ingredients Section
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 30)
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 30)
                    }
                }

                // Cooking Steps Section
                Text("How to Cook")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(steps, id: \.self) { step in
                        Text(step)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 30)
                    }
                }

                Spacer()
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("BackgroundStart"), Color("BackgroundEnd")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    // This function returns the ingredients and steps based on the selected recipe.
    private static func getRecipeDetails(for recipe: String) -> ([String], [String]) {
        switch recipe {
        case "Spaghetti Carbonara":
            return (
                ["200g Spaghetti", "2 Eggs", "100g Pancetta", "50g Parmesan cheese", "Garlic", "Olive oil", "Salt", "Pepper"],
                [
                    "1. Cook the spaghetti in salted water until al dente.",
                    "2. In a pan, cook the pancetta with a bit of olive oil until crispy.",
                    "3. Beat the eggs and mix with the Parmesan cheese.",
                    "4. Drain the spaghetti, reserving some pasta water.",
                    "5. Combine the spaghetti with the pancetta, then quickly stir in the egg mixture.",
                    "6. Add pasta water as needed to create a creamy sauce.",
                    "7. Season with salt and pepper, and serve with extra Parmesan."
                ]
            )
        case "Vegetable Stir Fry":
            return (
                ["1 cup Broccoli", "1 Carrot", "1 Bell Pepper", "Soy Sauce", "Olive Oil", "Garlic", "Rice", "Salt", "Pepper"],
                [
                    "1. Heat olive oil in a pan, and sauté garlic until fragrant.",
                    "2. Add vegetables and stir-fry on high heat for 5-7 minutes.",
                    "3. Add soy sauce and stir to coat the vegetables.",
                    "4. Cook rice separately and serve it with the stir-fried veggies.",
                    "5. Season with salt and pepper to taste."
                ]
            )
        case "Tomato Soup":
            return (
                ["4 Tomatoes", "1 Onion", "2 Garlic Cloves", "Olive Oil", "Vegetable Broth", "Salt", "Pepper"],
                [
                    "1. Heat olive oil in a pot, sauté onions and garlic until soft.",
                    "2. Add chopped tomatoes and cook until they break down.",
                    "3. Add vegetable broth and bring to a simmer.",
                    "4. Blend the soup until smooth and return to the pot.",
                    "5. Season with salt and pepper, and simmer for 10 more minutes.",
                    "6. Serve hot with a drizzle of cream."
                ]
            )
        case "Cheese Omelette":
            return (
                ["2 Eggs", "50g Cheese", "Butter", "Salt", "Pepper"],
                [
                    "1. Beat the eggs and season with salt and pepper.",
                    "2. Heat a pan and melt butter.",
                    "3. Pour in the beaten eggs and cook until slightly set.",
                    "4. Add cheese and fold the omelette.",
                    "5. Cook for a few more seconds until cheese melts, and serve."
                ]
            )
        case "Pancakes":
            return (
                ["1 cup Flour", "1 Egg", "1 cup Milk", "2 tbsp Sugar", "1 tsp Baking Powder", "Butter", "Maple Syrup"],
                [
                    "1. In a bowl, mix the flour, sugar, and baking powder.",
                    "2. Add milk and egg to the dry ingredients, and mix well.",
                    "3. Heat a pan and melt some butter.",
                    "4. Pour the batter onto the pan and cook until bubbles appear.",
                    "5. Flip the pancakes and cook until golden brown.",
                    "6. Serve with maple syrup and your favorite toppings."
                ]
            )
        default:
            return ([], [])
        }
    }
}
