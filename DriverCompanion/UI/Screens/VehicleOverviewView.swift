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
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else if let vehicle = viewModel.vehicle {
                Text("Vehicle: \(vehicle.name)")
                    .font(.headline)
                Text("Mileage: \(vehicle.mileage) miles")
                                .font(.subheadline)
                Button{
                    viewModel.toggleLock()
                } label: {
                    Text(vehicle.isLocked ? "Unlock" : "Lock")
                }
            } else {
                Text("No Vehicle Found")
            }
            
        }
        .padding()
        .task {
            await viewModel.loadVehicle()
        }
        
    }
}
