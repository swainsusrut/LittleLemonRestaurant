//
//  MenuItem.swift
//  LittleLemonRestaurant
//
//  Created by Swain, Susrut (Cognizant) on 03/02/25.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let descriptionDish: String
    let price: Float
    let image: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
