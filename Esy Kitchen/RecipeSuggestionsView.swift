import SwiftUI

struct RecipeSuggestionsView: View {
    var selectedIngredients: [String]

    // Sample recipes data
    let recipes = [
        ["Eggs", "Butter", "Sugar"]: "Classic Pancakes",
        ["Chicken", "Garlic", "Onion"]: "Garlic Chicken Stir Fry",
        ["Tomatoes", "Cheese", "Basil"]: "Margherita Pizza",
        ["Milk", "Chocolate Powder", "Sugar"]: "Chocolate Milkshake",
        ["Potatoes", "Butter", "Salt"]: "Mashed Potatoes",
        ["Eggs", "Butter", "Sugar"]: "Classic Pancakes",
        ["Chicken", "Garlic", "Onion"]: "Garlic Chicken Stir Fry",
        ["Tomatoes", "Cheese", "Basil"]: "Margherita Pizza",
        ["Milk", "Chocolate Powder", "Sugar"]: "Chocolate Milkshake",
        ["Potatoes", "Butter", "Salt"]: "Mashed Potatoes",
        ["Carrots", "Cinnamon", "Honey"]: "Carrot Cake",
        ["Cheese", "Bread Crumbs", "Olive Oil"]: "Crispy Mozzarella Sticks",
        ["Flour", "Yeast", "Water"]: "Homemade Pizza Dough",
        ["Eggs", "Flour", "Milk"]: "Simple Crepes",
        ["Chicken", "Soy Sauce", "Sesame Oil"]: "Teriyaki Chicken",
        ["Tomatoes", "Onion", "Spices"]: "Tomato Curry",
        ["Potatoes", "Paprika", "Olive Oil"]: "Spicy Potato Wedges",
        ["Cucumber", "Yogurt", "Mint"]: "Cucumber Raita",
        ["Apples", "Cinnamon", "Sugar"]: "Stewed Cinnamon Apples",
        ["Eggs", "Cheese", "Cream"]: "Cheese Omelette",
        ["Lemon", "Honey", "Ginger"]: "Lemon Ginger Tea",
        ["Flour", "Butter", "Sugar"]: "Basic Shortbread Cookies",
        ["Milk", "Vanilla", "Gelatin"]: "Vanilla Panna Cotta",
        ["Cornstarch", "Water", "Sugar"]: "Simple Syrup for Desserts",
        ["Zucchini", "Olive Oil", "Herbs"]: "Herb-Roasted Zucchini",
        ["Cheese", "Parmesan", "Butter"]: "Cheesy Parmesan Dip",
        ["Pineapple", "Lime", "Sugar"]: "Pineapple Lime Cooler",
        ["Peas", "Butter", "Salt"]: "Buttery Steamed Peas",
        ["Tofu", "Soy Sauce", "Sesame Oil"]: "Crispy Tofu Stir Fry",
        ["Carrots", "Honey", "Lemon"]: "Glazed Lemon Carrots",
        ["Bread Crumbs", "Cheese", "Paprika"]: "Cheesy Paprika Crust",
        ["Cocoa Powder", "Milk", "Sugar"]: "Hot Cocoa",
        ["Cranberries", "Sugar", "Water"]: "Cranberry Sauce",
        ["Peanuts", "Honey", "Cinnamon"]: "Honey Peanut Crunch",
        ["Yogurt", "Cucumber", "Dill"]: "Refreshing Cucumber Dip",
        ["Flour", "Butter", "Salt"]: "Flaky Pie Crust",
        ["Tomatoes", "Basil", "Olive Oil"]: "Tomato Basil Salad",
        ["Potatoes", "Cornflour", "Oil"]: "Crispy Potato Fries",
        ["Eggs", "Vanilla", "Sugar"]: "Vanilla Custard",
        ["Cinnamon", "Honey", "Nuts"]: "Cinnamon Honey Nut Spread",
        ["Zucchini", "Cheese", "Bread Crumbs"]: "Zucchini Fritters",
        ["Mint", "Lime", "Sugar"]: "Mint Lime Cooler",
        ["Tofu", "Ginger", "Soy Sauce"]: "Ginger Tofu Stir Fry",
        ["Peas", "Butter", "Mint"]: "Minty Buttered Peas",
        ["Saffron", "Milk", "Sugar"]: "Saffron Milk Drink",
        ["Cucumber", "Yogurt", "Garlic"]: "Cucumber Garlic Dip",
        ["Eggs", "Cheese", "Salt"]: "Cheesy Scrambled Eggs",
        ["Chicken", "Paprika", "Butter"]: "Paprika Butter Chicken",
        ["Tomatoes", "Garlic", "Olive Oil"]: "Tomato Garlic Sauce",
        ["Flour", "Water", "Cornstarch"]: "Crispy Tempura Batter",
        ["Milk", "Honey", "Vanilla"]: "Honey Vanilla Milkshake",
        ["Potatoes", "Cheese", "Butter"]: "Cheesy Mashed Potatoes",
        ["Carrots", "Honey", "Ginger"]: "Honey Ginger Glazed Carrots",
        ["Bread Crumbs", "Paprika", "Oil"]: "Spicy Breadcrumb Coating",
        ["Zucchini", "Cheese", "Olive Oil"]: "Cheesy Zucchini Bake",
        ["Cheese", "Cream", "Garlic"]: "Creamy Garlic Cheese Dip",
        ["Pineapple", "Honey", "Lime"]: "Pineapple Honey Sorbet",
        ["Lemon", "Sugar", "Water"]: "Classic Lemonade",
        ["Apples", "Cinnamon", "Honey"]: "Cinnamon Baked Apples",
        ["Peanuts", "Sugar", "Butter"]: "Peanut Brittle",
        ["Flour", "Yeast", "Salt"]: "Rustic Bread",
        ["Cocoa Powder", "Milk", "Vanilla"]: "Velvety Hot Chocolate",
        ["Chicken", "Lemon", "Garlic"]: "Lemon Garlic Chicken",
        ["Peas", "Cream", "Butter"]: "Creamed Peas",
        ["Mint", "Cucumber", "Lime"]: "Mint Cucumber Cooler",
        ["Cheese", "Parmesan", "Cream"]: "Parmesan Cream Sauce",
        ["Potatoes", "Olive Oil", "Herbs"]: "Herbed Roasted Potatoes",
        ["Yogurt", "Honey", "Mint"]: "Honey Mint Yogurt Dip",
        ["Cranberries", "Sugar", "Lime"]: "Cranberry Lime Relish",
        ["Tomatoes", "Basil", "Parmesan"]: "Tomato Basil Pasta Sauce",
        ["Ginger", "Honey", "Lemon"]: "Ginger Honey Tea",
        ["Vanilla", "Milk", "Sugar"]: "Vanilla Milk Pudding",
        ["Onion", "Garlic", "Olive Oil"]: "Caramelized Onion Garlic Spread",
        ["Carrots", "Dill", "Butter"]: "Butter Dill Glazed Carrots",
        ["Zucchini", "Parmesan", "Salt"]: "Parmesan Zucchini Chips",
        ["Soy Sauce", "Ginger", "Honey"]: "Ginger Soy Sauce Marinade",
        ["Flour", "Butter", "Sugar"]: "Butter Cookies",
        ["Potatoes", "Salt", "Cornflour"]: "Crispy Potato Chips",
        ["Tofu", "Paprika", "Salt"]: "Paprika Spiced Tofu",
        ["Chicken", "Olive Oil", "Herbs"]: "Herbed Olive Oil Chicken",
        ["Lime", "Sugar", "Mint"]: "Lime Mint Mojito",
        ["Milk", "Gelatin", "Vanilla"]: "Vanilla Milk Jelly",
        ["Cheese", "Tomatoes", "Bread Crumbs"]: "Cheesy Tomato Bake",
        ["Garlic", "Butter", "Herbs"]: "Garlic Herb Butter Spread",
        ["Peanuts", "Cocoa Powder", "Honey"]: "Chocolate Peanut Butter Spread",
        ["Cucumber", "Yogurt", "Salt"]: "Simple Cucumber Salad",
        ["Cornflour", "Sugar", "Water"]: "Cornflour Jelly Dessert",
        ["Zucchini", "Salt", "Olive Oil"]: "Grilled Zucchini Slices",
        ["Carrots", "Honey", "Lime"]: "Honey Lime Carrot Slaw",
        ["Saffron", "Honey", "Milk"]: "Saffron Honey Drink",
        ["Flour", "Yeast", "Cheese"]: "Cheese Bread Sticks",
        ["Cranberries", "Apples", "Cinnamon"]: "Cranberry Apple Compote",
        ["Butter", "Flour", "Cinnamon"]: "Cinnamon Butter Cookies",
        ["Lemon", "Sugar", "Honey"]: "Honey Lemon Syrup",
        ["Yogurt", "Mint", "Cucumber"]: "Cucumber Mint Yogurt Salad",
        ["Onion", "Garlic", "Spices"]: "Spiced Onion Garlic Dip",
        ["Chicken", "Soy Sauce", "Ginger"]: "Ginger Soy Chicken",
        ["Peas", "Cinnamon", "Butter"]: "Cinnamon Butter Peas",
        ["Tomatoes", "Cream", "Basil"]: "Creamy Tomato Basil Soup",
        ["Cheese", "Garlic", "Butter"]: "Cheesy Garlic Spread",
        ["Paprika", "Olive Oil", "Bread Crumbs"]: "Paprika Crusted Breadsticks",
        ["Carrots", "Cinnamon", "Honey"]: "Carrot Cake",
        ["Cheese", "Bread Crumbs", "Olive Oil"]: "Crispy Mozzarella Sticks",
        ["Flour", "Yeast", "Water"]: "Homemade Pizza Dough"
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header Section
                    Text("Recipe Suggestions")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        .padding(.top, 20)

                    Text("Based on your selected ingredients, here’s what you can try:")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)

                    // Suggested Recipes
                    ForEach(getMatchingRecipes(), id: \.self) { recipe in
                        RecipeCard(recipeName: recipe)
                    }

                    if getMatchingRecipes().isEmpty {
                        Text("No exact recipe match found.")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)

                        Text("Try selecting different ingredients!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("BackgroundStart"), Color("BackgroundEnd")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Recipe Suggestions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Helper Function
    func getMatchingRecipes() -> [String] {
        recipes.compactMap { (ingredients, recipe) in
            Set(ingredients) == Set(selectedIngredients) ? recipe : nil
        }
    }
}

struct RecipeCard: View {
    var recipeName: String

    var body: some View {
        VStack(spacing: 15) {
            Text(recipeName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("AccentColor"))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("BackgroundStart").opacity(0.8))
                )

            NavigationLink(destination: RecipeDetailView(recipeName: recipeName)) {
                Text("How to Make It")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

struct RecipeDetailView: View {
    var recipeName: String

    var body: some View {
        VStack {
            Text(recipeName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Detailed recipe instructions go here.")
                .font(.body)
                .padding()

            // Add additional content for recipe details (ingredients, steps, etc.)
            Spacer()
        }
        .navigationTitle(recipeName)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}
