//
//  VehicleOverviewViewModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//
import SwiftUI

@MainActor
final class VehicleOverviewViewModel: ObservableObject {
    @Published var vehicle: Vehicle?
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    private let service: VehicleService
    
    init(service: VehicleService = MockVehicleService()) {
        self.service = service
    }
    
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
    
    func toggleLock() {
        vehicle?.isLocked.toggle()
    }
}
