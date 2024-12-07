//
//  ViewModel.swift
//  Mock23_re
//
//  Created by Akila Gamage on 2024-12-05.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject {
    @Published var shopItems = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    @Published var isCheckout: Bool = false
    @Published var Total: Double = 0
    @Published var IsCartEmpty: Bool = false
    @AppStorage("previousBalance") var previousBalance: Double = 0
    
    
    func CalculateItemPrice(item: ShopItem) -> Double {
        let price = item.price * Double(item.quantity)
        return price
    }
    
    
    func CalculateTotalPrice(items: [ShopItem]) {
        for i in items {
            Total += CalculateItemPrice(item: i)
        }
        
        if(Total == 0){
            IsCartEmpty.toggle()
        }
    }
}
