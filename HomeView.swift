//
//  HomeView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct HomeView: View {
    // Dummy data
    private let categories = [
        HomeCategory(name: "Restaurants", imageName: "fork.knife"),
        HomeCategory(name: "Mart", imageName: "carrot.fill"),
        HomeCategory(name: "Drinks", imageName: "drop.fill"),
        HomeCategory(name: "Offers", imageName: "tag.fill")
    ]
    
    private let promoBanners = [
        PromoBanner(title: "Free Delivery", subtitle: "On orders over $20", imageName: "shippingbox.fill"),
        PromoBanner(title: "50% Off", subtitle: "On selected items today", imageName: "percent")
    ]
    
    private let featuredRestaurants = [
        Restaurant(name: "Momo Corner", cuisine: "Nepalese", rating: 4.7, deliveryTime: "25-35 min", imageName: "fork.knife", isFavorite: true),
        Restaurant(name: "Noodle House", cuisine: "Chinese", rating: 4.5, deliveryTime: "20-30 min", imageName: "fork.knife.circle", isFavorite: false),
        Restaurant(name: "Burger Palace", cuisine: "Fast Food", rating: 4.3, deliveryTime: "15-25 min", imageName: "takeoutbag.and.cup.and.straw.fill", isFavorite: true)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Promo Banners
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(promoBanners) { banner in
                                PromoBannerView(banner: banner)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Categories
                    VStack(alignment: .leading) {
                        Text("Categories")
                            .font(.title2.bold())
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 4), spacing: 15) {
                            ForEach(categories) { category in
                                CategoryCard(category: category)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Featured Restaurants
                    VStack(alignment: .leading) {
                        Text("Featured Restaurants")
                            .font(.title2.bold())
                            .padding(.horizontal)
                        
                        ForEach(featuredRestaurants) { restaurant in
                            RestaurantRow(restaurant: restaurant)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("MealMate")
        }
    }
}

struct PromoBannerView: View {
    let banner: PromoBanner
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(systemName: banner.imageName)
                .font(.title)
            Text(banner.title)
                .font(.headline)
            Text(banner.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 300, height: 120)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

struct CategoryCard: View {
    let category: HomeCategory
    
    var body: some View {
        VStack {
            Image(systemName: category.imageName)
                .font(.title2)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle()
                )
            Text(category.name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
    }
}

struct RestaurantRow: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(systemName: restaurant.imageName)
                .font(.title)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(restaurant.name)
                    .font(.headline)
                
                Text(restaurant.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    Text(String(restaurant.rating))
                        .font(.caption)
                    
                    Spacer()
                    
                    Text(restaurant.deliveryTime)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            if restaurant.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
