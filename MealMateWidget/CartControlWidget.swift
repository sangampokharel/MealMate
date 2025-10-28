import WidgetKit
import SwiftUI
import AppIntents

@available(iOS 18.0, *)
struct CartControlWidget: ControlWidget {
    let kind: String = "CartControlWidget"
    var body: some ControlWidgetConfiguration {
        makeControlConfiguration(
            kind: kind,
            category: "baskets",
            systemImage: "cart",
            displayName: "Basket",
            description: "MealMate"
        )
    }
}

@available(iOS 18.0, *)
struct RestaurantControlWidget: ControlWidget {
    let kind: String = "RestaurantControlWidget"
    var body: some ControlWidgetConfiguration {
        makeControlConfiguration(
            kind: kind,
            category: "restaurants",
            systemImage: "fork.knife",
            displayName: "Restaurants",
            description: "MealMate"
        )
    }
}

@available(iOS 18.0, *)
struct MartControlWidget: ControlWidget {
    let kind: String = "MartControlWidget"
    var body: some ControlWidgetConfiguration {
        makeControlConfiguration(
            kind: kind,
            category: "mart",
            systemImage: "carrot.fill",
            displayName: "Mart",
            description: "MealMate"
        )
    }
}

@available(iOS 18.0, *)
struct SearchControlWidget: ControlWidget {
    let kind: String = "SearchControlWidget"
    var body: some ControlWidgetConfiguration {
        makeControlConfiguration(
            kind: kind,
            category: "search",
            systemImage: "magnifyingglass",
            displayName: "Search",
            description: "MealMate"
        )
    }
}

// MARK: - Shared Configuration

@available(iOS 18.0, *)
private func makeControlConfiguration(
    kind: String,
    category: String,
    systemImage: String,
    displayName: String,
    description: String
) -> some ControlWidgetConfiguration {
    StaticControlConfiguration(kind: kind) {
        ControlWidgetButton(action: CartControlWidgetAppIntent(category: category)) {
            VStack {
                Image(systemName: systemImage)
                Text(displayName)
                    .font(.caption)
                Text("MealMate")
                    .font(.caption2)
            }
        }
    }
    .displayName("\(displayName)")
    .description("\(description)")
}
