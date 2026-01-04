//
//  VehicleListView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//
import SwiftUI

struct VehicleListView: View {
    @StateObject private var vehicleStore = VehicleStore()
    var body: some View {
        
        NavigationStack{
            if vehicleStore.isLoading {
                ProgressView()
            } else if let error = vehicleStore.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
            List(vehicleStore.vehicles) { vehicle in
                NavigationLink(value: vehicle.id) {
                    VehicleRowView(name:vehicle.name, isLocked: vehicle.isLocked)
                }
            }
            .navigationTitle("My Vehicles")
            .navigationDestination(for: Vehicle.ID.self) { id in
                VehicleDetailView(store: vehicleStore, vehicleID: id)
            }
            .task {
                await vehicleStore.loadVehicles()
            }
        }
    }
}
