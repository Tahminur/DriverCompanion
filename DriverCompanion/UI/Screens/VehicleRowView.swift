//
//  VehicleRowView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//

import SwiftUI

struct VehicleRowView: View {
    let vehicle: Vehicle
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Vehicle: \(vehicle.name)")
                    .font(.headline)
                Text(vehicle.isLocked ? "Unlock" : "Lock")
                    .font(.caption)
                    .foregroundColor(vehicle.isLocked ? .red : .green)
            }
            Spacer()
            
            Image(systemName: vehicle.isLocked ? "lock.fill" : "lock.open")
        }
    }
}
