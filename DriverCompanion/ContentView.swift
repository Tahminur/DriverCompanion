//
//  ContentView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VehicleListView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
