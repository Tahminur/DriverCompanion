//
//  VehicleOverviewView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//
import SwiftUI

struct VehicleDetailView: View {
    @StateObject var viewModel: VehicleDetailViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error{
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                Text("Vehicle: \(viewModel.vehicle.name)")
                    .font(.headline)
                Text("Mileage: \(viewModel.vehicle.mileage) miles")
                    .font(.subheadline)
                Button(viewModel.vehicle.isLocked ? "Unlock" : "Lock") {
                    Task {
                        await viewModel.toggleLock()
                    }
                }
            }
        }
        .padding()
        
    }
}
