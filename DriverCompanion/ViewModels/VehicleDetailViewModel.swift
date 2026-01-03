//
//  VehicleOverviewViewModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//
import SwiftUI

@MainActor
final class VehicleDetailViewModel: ObservableObject {
    @Published var vehicle: Vehicle
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    private let service: VehicleService
    
    init(
        vehicle: Vehicle,
         service: VehicleService = MockVehicleService()
    ) {
        self.service = service
        self.vehicle = vehicle
    }
    //below not needed anymore since vehicle is loaded by listview already
    func loadVehicle() async {
        isLoading = true
        error = nil
        do {
            let fetchedVehicle = try await service.fetchVehicle()
            vehicle = fetchedVehicle
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    func toggleLock() async {
        vehicle.isLocked.toggle()
        try? await service.updateVehicle(vehicle: vehicle)
    }
}
