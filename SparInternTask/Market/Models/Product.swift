//
//  Product.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

struct Product {
    let id: UUID
    let title: String
    let rating: Double
    let price: Double
    let discountPrice: Double?
    let discount: Int?
    let byWeight: Bool
    let badge: BadgeType?
}
