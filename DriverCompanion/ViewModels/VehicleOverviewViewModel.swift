//
//  VehicleOverviewViewModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//
import SwiftUI

@MainActor
final class VehicleOverviewViewModel: ObservableObject {
    @Published var vehicle: Vehicle
    
    init() {
        self.vehicle = Vehicle(name: "Lexus", mileage: 2_000, isLocked: true)
    }
    
    func toggleLock() {
        vehicle.isLocked.toggle()
    }
}
