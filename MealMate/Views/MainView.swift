//
//  MainView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct MainView: View {
    
    @Binding var selection:Int
    
    var body: some View {
        
        if #available(iOS 18.0, *) {
            TabView(selection: $selection) {
                Tab("Home", systemImage: "house", value: 0) {
                    HomeView()
                }
                
                Tab("Mart", systemImage: "carrot.fill", value: 1) {
                    MartView()
                }
                
                Tab("Basket", systemImage: "cart", value: 2) {
                    BasketView()
                }
                
                Tab("Restaurants", systemImage: "fork.knife", value: 3) {
                    RestaurantView()
                }
                
            }
        }else{
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                MartView()
                    .tabItem {
                        Image(systemName: "carrot.fill")
                        Text("Mart")
                    }.tag(1)
                
                BasketView()
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Basket")
                    }.tag(2)
                
                RestaurantView()
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Restaurants")
                    }.tag(3)
            }
        }
        
    }
}

#Preview {
    MainView(selection: .constant(0))
}
