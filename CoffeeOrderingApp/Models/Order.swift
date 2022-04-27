//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Dominik Woźniak on 12/03/2022.
//

import Foundation
struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
    
}
