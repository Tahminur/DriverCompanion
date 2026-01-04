//
//  VehicleRowView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//

import SwiftUI

struct VehicleRowView: View {
    let name: String
    let isLocked: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Vehicle: \(name)")
                    .font(.headline)
                Text(isLocked ? "Unlock" : "Lock")
                    .font(.caption)
                    .foregroundColor(isLocked ? .red : .green)
            }
            Spacer()
            
            Image(systemName: isLocked ? "lock.fill" : "lock.open")
        }
    }
}
