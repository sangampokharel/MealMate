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
        let entries:[SimpleEntry] = [SimpleEntry(date: .now)]
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
    @Environment(\.widgetFamily) private var family
    var entry: SimpleEntry

    var body: some View {
        VStack {
            
            Link(destination: URL(string: "search")!) {
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
            }
            
            Spacer()
            
            switch family {
            case .systemSmall:
                   Text("Search MealMate")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title3.bold())
                        .widgetAccentable()
                
            case .systemMedium:
                HStack {
                    Link(destination: URL(string: "restaurants")!) {
                        MealMateMediumCategoryView(image: "fork.knife", title: "Restaurant")
                    }
                    Spacer()
                    Link(destination: URL(string: "mart")!) {
                        MealMateMediumCategoryView(image: "birthday.cake.fill", title: "mart")
                    }
                    Spacer()
                    Link(destination: URL(string: "baskets")!) {
                        MealMateMediumCategoryView(image: "cart", title: "Basket")
                    }
                        
                }
           
            case .systemLarge,.systemExtraLarge,.systemExtraLargePortrait,.accessoryCorner, .accessoryRectangular,.accessoryInline,.accessoryCircular::
                EmptyView()
            default:
                EmptyView()
            }
            
            
        }
        .containerBackground(for: .widget) { }
//        .widgetURL(URL(string: "coke"))
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
        .supportedFamilies([.systemSmall, .systemMedium, .accessoryCircular])
    }
}

#Preview(as: .systemMedium) {
    MealMateWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now)
}

struct MealMateMediumCategoryView:View {
    let image:String
    let title:String
    var body: some View {
        VStack(spacing:6) {
            Image(systemName: image)
               
            Text(title)
                .font(.caption)
              
        }
        .widgetAccentable()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
    }
}
