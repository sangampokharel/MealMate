//
//  MainView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct MainView: View {
    @Binding var selection: Int
    
    private struct TabConfiguration {
        let title: String
        let systemImage: String
        let tag: Int
        let view: AnyView
    }
    
    private let tabs: [TabConfiguration] = [
        TabConfiguration(title: "Home", systemImage: "house", tag: 0, view: AnyView(HomeView())),
        TabConfiguration(title: "Mart", systemImage: "carrot.fill", tag: 1, view: AnyView(MartView())),
        TabConfiguration(title: "Basket", systemImage: "cart", tag: 2, view: AnyView(BasketView())),
        TabConfiguration(title: "Restaurants", systemImage: "fork.knife", tag: 3, view: AnyView(RestaurantView()))
    ]
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(tabs, id: \.tag) { tab in
                tab.view
                    .tabItem {
                        Image(systemName: tab.systemImage)
                        Text(tab.title)
                    }
                    .tag(tab.tag)
            }
        }
    }
}

#Preview {
    MainView(selection: .constant(0))
}
