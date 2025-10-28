//
//  SearchView.swift
//  MealMate
//
//  Created by sangam pokharel on 28/10/2025.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .padding()
                .frame(height: 60)
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
