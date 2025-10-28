//
//  ContentView.swift
//  MealMate
//
//  Created by sangam pokharel on 27/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        MainView(selection: $selectedTab)
    }
}

#Preview {
    ContentView()
}
