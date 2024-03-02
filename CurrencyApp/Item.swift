//
//  Item.swift
//  CurrencyApp
//
//  Created by Alexey Tsutsoev on 02.03.2024.
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
