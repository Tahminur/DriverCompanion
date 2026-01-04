//
//  VehicleListViewmModel.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/2/26.
//

import SwiftUI

@MainActor
final class VehicleListViewModel: ObservableObject {
    @ObservedObject private var vehicleStore: VehicleStore
    let vehicleID: Vehicle.ID
    
    
    init(_ vehicleStore: VehicleStore, _ vehicleID: Vehicle.ID) {
        self.vehicleID = vehicleID
        self.vehicleStore = vehicleStore
    }
    
//    func loadVehicles() async {
//        isLoading = true
//        error = nil
//        do {
//            let fetchedVehicle = try await service.fetchVehicles()
//            vehicles = fetchedVehicle
//        } catch {
//            self.error = error.localizedDescription
//        }
//        isLoading = false
//    }
}
