//
//  AppIntents.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//
import AppIntents
import SwiftUI

@available(iOS, introduced: 18.0)
struct ControlButtonIntent: AppIntent {
    static var title: LocalizedStringResource = "Control Button"
    static var openAppWhenRun: Bool = true
    
    @MainActor
        func perform() async throws -> some IntentResult & OpensIntent {
            let url = URL(string: "mealmate://search")!
            EnvironmentValues().openURL(url)
            return .result(opensIntent: OpenURLIntent(url))
        }
}


