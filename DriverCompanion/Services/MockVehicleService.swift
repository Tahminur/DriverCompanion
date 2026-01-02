//
//  MockVehicleService.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 1/1/26.
//

import Foundation

protocol VehicleService {
    func fetchVehicle() async throws -> Vehicle
}

struct MockVehicleService: VehicleService {
    func fetchVehicle() async throws -> Vehicle {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000)
        return Vehicle(name: "Lexus", mileage: 20_000, isLocked: true)
    }
}
