//
//  MealMateApp.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//

import SwiftUI

@main
struct MealMateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    let data = url.absoluteString
                    print("data: \(data)")
                }
        }
    }
}
