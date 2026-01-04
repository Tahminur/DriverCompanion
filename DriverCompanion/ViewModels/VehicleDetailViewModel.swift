//
//  VehicleOverviewViewModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//
import SwiftUI

@MainActor
final class VehicleDetailViewModel: ObservableObject {
    @ObservedObject private var vehicleStore: VehicleStore
    let vehicleID: Vehicle.ID
    
    init(_ vehicleStore: VehicleStore, _ vehicleID: Vehicle.ID) {
        self.vehicleID = vehicleID
        self.vehicleStore = vehicleStore
    }
    var vehicle: Vehicle? {
        vehicleStore.vehicle(vehicleID)
    }

    var nameText: String {
        vehicle?.name ?? "Unknown"
    }

    var mileageText: String {
        vehicle.map { "\($0.mileage)" } ?? "--"
    }

    var isLocked: Bool {
        vehicle?.isLocked ?? false
    }

    func toggleLock() async {
        await vehicleStore.toggleLockStatus(vehicleID)
    }
}
