import SwiftUI

struct HomeView: View {
    @State private var selectedIngredients = [String?](repeating: nil, count: 3)
    @State private var searchTexts = [String](repeating: "", count: 3)

    @State private var allIngredients = [
        "Eggs", "Butter", "Sugar", "Chocolate Powder", "Milk", "Flour", "Chicken", "Garlic", "Onion", "Ginger",
        "Olive Oil", "Spices", "Cheese", "Cream", "Tomatoes", "Basil", "Parmesan", "Water", "Yeast", "Salt",
        "Soy Sauce", "Sesame Oil", "Vanilla", "Gelatin", "Herbs", "Apples", "Cinnamon", "Honey", "Nuts",
        "Lemon", "Dill", "Carrots", "Potatoes", "Cornflour", "Zucchini", "Bread Crumbs", "Cocoa Powder",
        "Cornstarch", "Peanuts", "Lime", "Cranberries", "Paprika", "Pineapple", "Cucumber", "Yogurt", "Mint",
        "Peas", "Cardamom", "Saffron", "Tofu"
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Header Section
                Text("Build Your Recipe")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.top, 40)
                    .padding(.horizontal, 30)

                Text("Select up to three ingredients to discover delicious recipes tailored for you.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)

                // Dropdown Selections
                VStack(spacing: 20) {
                    ForEach(0..<3, id: \.self) { index in
                        DropdownPicker(
                            title: "Choose Ingredient \(index + 1)",
                            selection: $selectedIngredients[index],
                            searchText: $searchTexts[index],
                            options: availableOptions(excluding: selectedIngredients.enumerated().compactMap { $0.element })
                        )
                    }
                }
                .padding(.horizontal, 30)

                Spacer()

                // Find Recipes Button
                NavigationLink(destination: RecipeSuggestionsView(selectedIngredients: selectedIngredients.compactMap { $0 })) {
                    Text("Find Recipes")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            isSelectionComplete()
                            ? LinearGradient(gradient: Gradient(colors: [Color("AccentColor"), Color("BackgroundEnd")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            : LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding(.horizontal, 30)
                        .scaleEffect(isSelectionComplete() ? 1.05 : 1)
                        .animation(.easeInOut, value: isSelectionComplete())
                }
                .disabled(!isSelectionComplete())
                .padding(.bottom, 40)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("BackgroundStart"), Color("BackgroundEnd")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Esy Kitchen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Helper Functions
    func isSelectionComplete() -> Bool {
        !selectedIngredients.contains(nil)
    }

    func availableOptions(excluding selected: [String?]) -> [String] {
        allIngredients.filter { !selected.contains($0) }
    }
}

struct DropdownPicker: View {
    let title: String
    @Binding var selection: String?
    @Binding var searchText: String
    let options: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Search Bar
            TextField(
                searchText.isEmpty ? "Search Ingredients" : searchText,
                text: $searchText
            )
            .padding(12)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            .foregroundColor(selection == nil ? .gray : .accentColor)
            .overlay(
                HStack {
                    if searchText.isEmpty {
                        Text("Search Ingredients")
                            .foregroundColor(Color.gray)
                            .padding(.leading, 12)
                    }
                    Spacer()
                }
            )
            .onChange(of: searchText) { newValue in
                if newValue.isEmpty {
                    selection = nil
                }
            }
            .padding(.horizontal, 10)

            // Dropdown menu
            Menu {
                ForEach(filteredOptions(), id: \.self) { option in
                    Button(action: {
                        selection = option
                        searchText = option
                    }) {
                        Text(option)
                            .fontWeight(.medium)
                    }
                }
                if filteredOptions().isEmpty {
                    Text("No results found")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            } label: {
                HStack {
                    Text(selection ?? title)
                        .foregroundColor(selection == nil ? Color.gray : .primary)
                        .font(.body)
                        .padding(.leading, 10)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.secondary)
                        .padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("DropdownBackground"))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
            }
            .padding(.horizontal, 10)
        }
    }

    private func filteredOptions() -> [String] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
