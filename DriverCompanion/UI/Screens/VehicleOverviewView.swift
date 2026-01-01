//
//  VehicleOverviewView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//
import SwiftUI

struct VehicleOverviewView: View {
    @StateObject private var viewModel: VehicleOverviewViewModel = .init()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Vehicle: \(viewModel.vehicle.name)")
                .font(.headline)
            Text("Mileage: \(viewModel.vehicle.mileage) miles")
                            .font(.subheadline)
            Button{
                viewModel.toggleLock()
            } label: {
                Text(viewModel.vehicle.isLocked ? "Unlock" : "Lock")
            }
        }
        .padding()
        
    }
}
