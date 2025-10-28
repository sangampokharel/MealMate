//
//  DataModels.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import Foundation
import SwiftUI

// MARK: - Restaurant Models
struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let deliveryTime: String
    let imageName: String
    let isFavorite: Bool
}

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageName: String
}

// MARK: - Mart Models
struct MartCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct MartItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let categoryName: String
    let imageName: String
    let weight: String
}

// MARK: - Basket Models
struct BasketItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let quantity: Int
    let imageName: String
}

// MARK: - Home Models
struct HomeCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct PromoBanner: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}
