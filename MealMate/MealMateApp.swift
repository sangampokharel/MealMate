//
//  MealMateApp.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//

import SwiftUI

@main
struct MealMateApp: App {
    @State private var selection = 0
    @State private var presentSearch = false

    var body: some Scene {
        WindowGroup {
            MainView(selection: $selection)
                .onOpenURL { url in
                    print("Received URL: \(url.absoluteString)")
                    guard let host = url.host() else {
                        return
                    }
                    
                    if host == "baskets" {
                        selection = 2
                    } else if host == "mart" {
                        selection = 1
                    } else if host == "search" {
                        presentSearch = true
                    } else if host == "restaurants" {
                        selection = 3
                    } else {
                        // handle unknown hosts if needed
                    }
                }
                .sheet(isPresented: $presentSearch) {
                    SearchView()
                }
        }
    }
}
