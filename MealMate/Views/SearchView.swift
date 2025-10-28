//
//  SearchView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @State private var searchResults: [SearchResult] = []
    @State private var isSearching = false
    
    // Dummy search suggestions
    private let popularSearches = [
        "Momo", "Chowmein", "Pizza", "Burger", 
        "Sushi", "Tacos", "Salad", "Smoothie"
    ]
    
    // Dummy recent searches
    private let recentSearches = [
        "Momo Corner", "Noodle House", "Apple", "Coke"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search restaurants, foods, drinks...", text: $search) { isEditing in
                            isSearching = isEditing
                        }
                        .textFieldStyle(PlainTextFieldStyle())
                        .onSubmit {
                            performSearch()
                        }
                        
                        if !search.isEmpty {
                            Button(action: clearSearch) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    
                    if isSearching {
                        Button("Cancel") {
                            clearSearch()
                            isSearching = false
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        .padding(.leading, 8)
                    }
                }
                .padding()
                
                // Search Content
                if search.isEmpty {
                    SearchSuggestionsView(popularSearches: popularSearches, recentSearches: recentSearches) {
                        search = $0
                        performSearch()
                    }
                } else {
                    SearchResultsView(searchResults: searchResults)
                }
                
                Spacer()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            // Initialize with some dummy data
            searchResults = generateDummyResults()
        }
    }
    
    private func performSearch() {
        // In a real app, this would call an API
        searchResults = generateDummyResults()
    }
    
    private func clearSearch() {
        search = ""
        searchResults = []
    }
    
    private func generateDummyResults() -> [SearchResult] {
        return [
            SearchResult(title: "Momo Corner", subtitle: "Nepalese • 4.7 ★ (1.2k reviews)", category: "Restaurant", imageName: "fork.knife"),
            SearchResult(title: "Chicken Momo", subtitle: "Steamed dumplings with chicken filling", category: "Food Item", imageName: "circle.fill"),
            SearchResult(title: "Noodle House", subtitle: "Chinese • 4.5 ★ (850 reviews)", category: "Restaurant", imageName: "fork.knife.circle"),
            SearchResult(title: "Vegetable Chowmein", subtitle: "Stir-fried noodles with fresh vegetables", category: "Food Item", imageName: "circle.fill"),
            SearchResult(title: "Pizza Heaven", subtitle: "Italian • 4.6 ★ (2.1k reviews)", category: "Restaurant", imageName: "circle.fill"),
            SearchResult(title: "Coke", subtitle: "Refreshing cola drink", category: "Drink", imageName: "drop.fill"),
            SearchResult(title: "Apple", subtitle: "Fresh red apples from local farms", category: "Grocery", imageName: "leaf.fill"),
        ]
    }
}

struct SearchResult: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let category: String
    let imageName: String
}

struct SearchSuggestionsView: View {
    let popularSearches: [String]
    let recentSearches: [String]
    let onSearch: (String) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Popular Searches
                VStack(alignment: .leading, spacing: 10) {
                    Text("Popular Searches")
                        .font(.title2.bold())
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                        ForEach(popularSearches, id: \.self) { search in
                            SearchTagView(title: search) {
                                onSearch(search)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Recent Searches
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Recent Searches")
                            .font(.title2.bold())
                        Spacer()
                        Button("Clear") {
                            // Clear recent searches action
                        }
                        .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                    ForEach(recentSearches.prefix(3), id: \.self) { search in
                        Button(action: {
                            onSearch(search)
                        }) {
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                Text(search)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
    }
}

struct SearchTagView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct SearchResultsView: View {
    let searchResults: [SearchResult]
    
    var body: some View {
        List {
            ForEach(searchResults) { result in
                SearchResultRow(result: result)
            }
        }
    }
}

struct SearchResultRow: View {
    let result: SearchResult
    
    var body: some View {
        HStack {
            Image(systemName: result.imageName)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(result.title)
                    .font(.headline)
                
                Text(result.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(result.category)
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(4)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SearchView()
}
