//
//  Dish.swift
//  iSushi
//
//  Created by iOS Developer on 15/12/25.
//

import Foundation

struct Dish: Identifiable, Decodable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let category: String
    let imageUrl: String
}

