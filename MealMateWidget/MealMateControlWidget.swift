//
//  MealMateControlWidget.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//

import WidgetKit
import SwiftUI
import AppIntents

@available(iOS, introduced: 18.0)
struct MealMateControlWidget: ControlWidget {
    let kind: String = "MealMateControlWidget"
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: kind) {
            ControlWidgetButton(action: ControlButtonIntent()) {
                VStack {
                    Image(systemName: "cart")
                    Text("Basket")
                        .font(.caption)
                    Text("MealMate")
                        .font(.caption2)
                }
            }
        }
        .displayName("Basket")
        .description("MealMate")
    }
}

