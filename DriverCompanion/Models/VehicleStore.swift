//
//  VehicleStore.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/3/26.
//
import Foundation

@MainActor
final class VehicleStore: ObservableObject {
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
    
    func vehicle(_ id: UUID) -> Vehicle? {
        return vehicles.first(where: { $0.id == id })
    }
    
    func toggleLockStatus(_ id: UUID) async {
        guard let index = vehicles.firstIndex(where: { $0.id == id}) else {
            return
        }
        vehicles[index].isLocked.toggle()
        await updateVehicle(vehicles[index])
    }
    //maybe change to by id as well?
    func updateVehicle(_ vehicle: Vehicle) async {
        do {
            try await service.updateVehicle(vehicle)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
