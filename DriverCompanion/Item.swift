//
//  Item.swift
//  DriverCompanion
//
//  Created by Tahminur Rahman on 12/31/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
