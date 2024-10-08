//
//  Product.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

struct Product: Identifiable {
    let id: String
    let title: String
    let image: String
    let rating: String
    let price: String
    let discountPrice: String?
    let discount: String?
    let byWeight: Bool
    let badge: BadgeType?
    let country: String?
}
