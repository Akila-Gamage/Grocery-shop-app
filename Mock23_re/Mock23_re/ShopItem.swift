//
//  ShopItem.swift
//  Mock23_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import Foundation

class ShopItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    
    }
}
