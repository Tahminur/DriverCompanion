//
//  DriverCompanionTests.swift
//  DriverCompanionTests
//
//  Created by Tahminur Rahman on 12/31/25.
//

import Testing
@testable import DriverCompanion

struct DriverCompanionTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}

import XCTest

final class VehicleOverviewViewModelTests: XCTestCase {
    @MainActor
    func testToggleLock() {
        let viewModel = VehicleOverviewViewModel()
        let curr = viewModel.vehicle.isLocked
        
        // Toggle once
        viewModel.toggleLock()
        XCTAssertFalse(curr == viewModel.vehicle.isLocked)
        
        // Toggle again
        viewModel.toggleLock()
        XCTAssertTrue(curr == viewModel.vehicle.isLocked)
    }
}
