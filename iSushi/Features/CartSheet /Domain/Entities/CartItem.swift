//
//  CartItem.swift
//  iSushi
//
//  Created by iOS Developer on 30/12/25.
//

import Foundation

struct CartItem: Identifiable{
    let id = UUID()
    let dish: Dish
    var quantity: Int
    
    var subTotal: Double {
        dish.price * Double(quantity)
    }
}
