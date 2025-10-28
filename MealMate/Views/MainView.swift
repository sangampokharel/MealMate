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
                    Text("Home")
                }
                
                Tab("Mart", systemImage: "carrot.fill", value: 1) {
                    Text("Mart")
                }
                
                Tab("Basket", systemImage: "cart", value: 2) {
                    Text("Baskets")
                }
                
                Tab("Restaurants", systemImage: "fork.knife", value: 3) {
                    Text("Restaurants")
                }
                
            }
        }else{
            TabView(selection: $selection) {
                Text("Home")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                Text("Mart")
                    .tabItem {
                        Image(systemName: "carrot.fill")
                        Text("Mart")
                    }.tag(1)
                
                Text("Baskets")
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Baskets")
                    }.tag(2)
                
                Text("Restaurants")
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
