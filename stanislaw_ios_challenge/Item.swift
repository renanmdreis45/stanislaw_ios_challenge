//
//  Item.swift
//  stanislaw_ios_challenge
//
//  Created by Renan Martins Dantas Reis on 03/06/25.
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
