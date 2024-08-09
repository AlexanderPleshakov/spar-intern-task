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
    let rating: String
    let price: String
    let discountPrice: String?
    let discount: String?
    let byWeight: Bool
    let badge: BadgeType?
}
