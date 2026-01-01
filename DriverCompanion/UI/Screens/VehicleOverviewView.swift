//
//  VehicleOverviewView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//
import SwiftUI

struct VehicleOverviewView: View {
    @State private var vehicle: Vehicle = Vehicle(name: "Lexus", mileage: 20000, isLocked: true)
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Vehicle: \(vehicle.name)")
                .font(.headline)
            Text("Mileage: \(vehicle.mileage) miles")
                            .font(.subheadline)
            Button(action: {
                vehicle.isLocked.toggle()
            }) {
                Text(vehicle.isLocked ? "Unlock" : "Lock")
            }
        }
        .padding()
        
    }
}
