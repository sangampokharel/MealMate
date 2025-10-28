//
//  AppIntents.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//
import AppIntents
import SwiftUI

@available(iOS, introduced: 18.0)
struct CartControlWidgetAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Control Button"
    static var openAppWhenRun: Bool = true
    
    @Parameter(title:"category")
    var category:String
    
    init(category: String) {
        self.category = category
    }
    
    init() {
         
    }
    
    @MainActor
        func perform() async throws -> some IntentResult & OpensIntent {
            print("😉Received Parameter \(category)")
            let url = URL(string: "mealmate://\(category)")!
            EnvironmentValues().openURL(url)
            return .result(opensIntent: OpenURLIntent(url))
        }
}


