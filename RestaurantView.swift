//
//  RestaurantView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct RestaurantView: View {
    // Dummy data
    private let restaurants = [
        Restaurant(name: "Momo Corner", cuisine: "Nepalese, Asian", rating: 4.7, deliveryTime: "25-35 min", imageName: "fork.knife", isFavorite: true),
        Restaurant(name: "Noodle House", cuisine: "Chinese, Asian", rating: 4.5, deliveryTime: "20-30 min", imageName: "fork.knife.circle", isFavorite: false),
        Restaurant(name: "Burger Palace", cuisine: "Fast Food, American", rating: 4.3, deliveryTime: "15-25 min", imageName: "takeoutbag.and.cup.and.straw.fill", isFavorite: true),
        Restaurant(name: "Pizza Heaven", cuisine: "Italian, Pizza", rating: 4.6, deliveryTime: "30-40 min", imageName: "circle.fill", isFavorite: false),
        Restaurant(name: "Sushi Master", cuisine: "Japanese, Sushi", rating: 4.8, deliveryTime: "35-45 min", imageName: "circle.fill", isFavorite: true)
    ]
    
    var body: some View {
        NavigationView {
            List(restaurants) { restaurant in
                RestaurantRow(restaurant: restaurant)
            }
            .navigationTitle("Restaurants")
        }
    }
}

#Preview {
    RestaurantView()
}
