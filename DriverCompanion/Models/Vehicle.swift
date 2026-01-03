//
//  Vehicle.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//
import Foundation

struct Vehicle : Identifiable, Hashable{
    let id: UUID
    let name: String
    let mileage: Int
    var isLocked: Bool
}
