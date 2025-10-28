//
//  BasketView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct BasketView: View {
    // Dummy data
    @State private var basketItems = [
        BasketItem(name: "Chicken Momo", price: 8.99, quantity: 2, imageName: "circle.fill"),
        BasketItem(name: "Vegetable Chowmein", price: 7.99, quantity: 1, imageName: "circle.fill"),
        BasketItem(name: "Coke", price: 1.99, quantity: 3, imageName: "circle.fill"),
        BasketItem(name: "Apple", price: 2.99, quantity: 4, imageName: "circle.fill"),
        BasketItem(name: "Cheese Pizza", price: 12.99, quantity: 1, imageName: "circle.fill")
    ]
    
    private var total: Double {
        basketItems.reduce(0) { sum, item in
            sum + (item.price * Double(item.quantity))
        }
    }
    
    private var itemCount: Int {
        basketItems.reduce(0) { sum, item in
            sum + item.quantity
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if basketItems.isEmpty {
                    EmptyBasketView()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(basketItems) { item in
                                BasketItemRow(item: item)
                            }
                        }
                        .padding()
                    }
                    
                    BasketSummaryView(total: total, itemCount: itemCount)
                }
            }
            .navigationTitle("Basket")
        }
    }
}

struct BasketItemRow: View {
    let item: BasketItem
    
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
                
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    // Decrease quantity
                }) {
                    Image(systemName: "minus.circle")
                }
                
                Text("\(item.quantity)")
                    .frame(width: 40)
                
                Button(action: {
                    // Increase quantity
                }) {
                    Image(systemName: "plus.circle")
                }
            }
            
            Text("$\(item.price * Double(item.quantity), specifier: "%.2f")")
                .font(.headline)
                .frame(width: 60)
        }
    }
}

struct BasketSummaryView: View {
    let total: Double
    let itemCount: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Total Items: \(itemCount)")
                Spacer()
                Text("Subtotal: $\(total, specifier: "%.2f")")
            }
            .padding(.horizontal)
            
            Button(action: {
                // Checkout action
            }) {
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}

struct EmptyBasketView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("Your basket is empty")
                .font(.title2)
            
            Text("Add items from restaurants or the mart")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    BasketView()
}
