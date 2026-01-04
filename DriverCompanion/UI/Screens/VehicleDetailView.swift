//
//  VehicleOverviewView.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//
import SwiftUI

struct VehicleDetailView: View {
    @ObservedObject var store: VehicleStore
    let vehicleID: Vehicle.ID
    var vehicle: Vehicle? {
        store.vehicle(vehicleID)
    }
    var body: some View {
        VStack(spacing: 16) {
            Text("Vehicle: \(vehicle?.name ?? "Unknown")")
            Text("Mileage: \(vehicle?.mileage ?? 0) miles")

            Button((vehicle?.isLocked ?? false) ? "Unlock" : "Lock") {
                Task {
                    await store.toggleLockStatus(vehicleID)
                }
            }
        }
    }
}

