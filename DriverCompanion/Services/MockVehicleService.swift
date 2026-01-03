//
//  MockVehicleService.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//

import Foundation

protocol VehicleService {
    func fetchVehicle() async throws -> Vehicle
    func updateVehicle(vehicle: Vehicle) async throws
    func fetchVehicles() async throws -> [Vehicle]
}

struct MockVehicleService: VehicleService {
    func fetchVehicle() async throws -> Vehicle {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        return Vehicle(id: UUID(),name: "Lexus", mileage: 20_000, isLocked: true)
    }
    
    func updateVehicle(vehicle: Vehicle) async throws {
        //simulate network delay for uploading vehicle change to backend
        try await Task.sleep(nanoseconds: 500_000_000)
    }
    
    func fetchVehicles() async throws -> [Vehicle] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        return [Vehicle(id: UUID(), name: "Lexus", mileage: 20_000, isLocked: true)]
    }
}
