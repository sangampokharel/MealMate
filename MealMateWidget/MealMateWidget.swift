//
//  MealMateWidget.swift
//  MealMateWidget
//
//  Created by sangam pokharel on 27/10/2025.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries:[SimpleEntry] = []
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MealMateWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "fork.knife.circle.fill")
                    .widgetAccentable()
                Spacer()
                Image(systemName: "magnifyingglass")
                    .widgetAccentable()
            }
            .padding(.horizontal,12)
            .padding(.vertical,12)
            .background(Color(UIColor.systemGray6))
            .clipShape(Capsule())
            
            Spacer()
            
            Text("Search MealMate")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.title3.bold())
                .widgetAccentable()
        }
        .containerBackground(for: .widget) { }
        .widgetURL(URL(string: "coke"))
    }
}

struct MealMateWidget: Widget {
    let kind: String = "MealMateWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MealMateWidgetEntryView(entry: entry)
             } else {
                MealMateWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Search MealMate")
        .description("Search for momo,chowmin and coke.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    MealMateWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now)
}
