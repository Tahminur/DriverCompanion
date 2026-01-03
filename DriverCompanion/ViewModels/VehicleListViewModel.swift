//
//  VehicleListViewmModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//

import SwiftUI

@MainActor
final class VehicleListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var vehicles: [Vehicle] = []
    @Published var error: String?
    
    private let service: VehicleService
    
    init(service: VehicleService = MockVehicleService()) {
        self.service = service
    }
    
    func loadVehicles() async {
        isLoading = true
        error = nil
        do {
            let fetchedVehicle = try await service.fetchVehicles()
            vehicles = fetchedVehicle
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
