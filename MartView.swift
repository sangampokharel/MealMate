//
//  MartView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct MartView: View {
    // Dummy data
    private let categories = [
        MartCategory(name: "Fruits", imageName: "leaf.fill"),
        MartCategory(name: "Vegetables", imageName: "carrot.fill"),
        MartCategory(name: "Meat", imageName: "hare.fill"),
        MartCategory(name: "Dairy", imageName: "drop.fill"),
        MartCategory(name: "Beverages", imageName: "drop.fill"),
        MartCategory(name: "Snacks", imageName: "bag.fill")
    ]
    
    private let items = [
        MartItem(name: "Apple", price: 2.99, categoryName: "Fruits", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Banana", price: 1.99, categoryName: "Fruits", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Carrot", price: 1.49, categoryName: "Vegetables", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Broccoli", price: 2.49, categoryName: "Vegetables", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Chicken Breast", price: 8.99, categoryName: "Meat", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Ground Beef", price: 6.99, categoryName: "Meat", imageName: "circle.fill", weight: "1 lb"),
        MartItem(name: "Milk", price: 3.99, categoryName: "Dairy", imageName: "circle.fill", weight: "1 gal"),
        MartItem(name: "Cheese", price: 4.99, categoryName: "Dairy", imageName: "circle.fill", weight: "8 oz")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Categories
                    VStack(alignment: .leading) {
                        Text("Categories")
                            .font(.title2.bold())
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                            ForEach(categories) { category in
                                MartCategoryCard(category: category)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Items
                    VStack(alignment: .leading) {
                        Text("Popular Items")
                            .font(.title2.bold())
                            .padding(.horizontal)
                        
                        ForEach(items) { item in
                            MartItemRow(item: item)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Mart")
        }
    }
}

struct MartCategoryCard: View {
    let category: MartCategory
    
    var body: some View {
        VStack {
            Image(systemName: category.imageName)
                .font(.title)
                .foregroundColor(.green)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(category.name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(height: 100)
    }
}

struct MartItemRow: View {
    let item: MartItem
    
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.weight)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(item.categoryName)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("$\(item.price, specifier: "%.2f")")
                .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    MartView()
}
