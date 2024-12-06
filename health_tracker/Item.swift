//
//  Item.swift
//  health_tracker
//
//  Created by Daanish Faiz on 6/12/2024.
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
