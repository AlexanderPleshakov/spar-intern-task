//
//  Mocks.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

enum Mocks {
    static let products: [Product] = [
        Product(
            id: UUID(),
            title: "Дорадо Охлажденная Непотрошеная 300-400г",
            image: "p1",
            rating: "4.1",
            price: "199.0",
            discountPrice: "99.90",
            discount: nil,
            byWeight: false,
            badge: BadgeType.new,
            country: "Франция 🇫🇷"
        ),
        Product(
            id: UUID(),
            title: "сыр Ламбер 500/0 230г",
            image: "p2",
            rating: "4.9",
            price: "95800.0",
            discountPrice: "95699.90",
            discount: "5%",
            byWeight: false,
            badge: BadgeType.priceHit,
            country: nil
        ),
        Product(
            id: UUID(),
            title: "Салат Овощной с Крабовыми Палочками",
            image: "p3",
            rating: "4.8",
            price: "399.0",
            discountPrice: "199.90",
            discount: nil,
            byWeight: false,
            badge: nil,
            country: nil
        ),
        Product(
            id: UUID(),
            title: "Ролл Маленькая Япония 216г",
            image: "p4",
            rating: "4.2",
            price: "399.0",
            discountPrice: "300.90",
            discount: "25%",
            byWeight: false,
            badge: .cardPrice,
            country: "Германия 🇩🇪"
        ),
        Product(
            id: UUID(),
            title: "Дорадо Охлажденная Непотрошеная 300-400г",
            image: "p5",
            rating: "4.1",
            price: "199.0",
            discountPrice: "99.90",
            discount: nil,
            byWeight: false,
            badge: BadgeType.new,
            country: nil
        ),
        Product(
            id: UUID(),
            title: "сыр Ламбер 500/0 230г",
            image: "p6",
            rating: "4.9",
            price: "95800.0",
            discountPrice: "95699.90",
            discount: "5%",
            byWeight: false,
            badge: BadgeType.priceHit,
            country: nil
        ),
        Product(
            id: UUID(),
            title: "Салат Овощной с Крабовыми Палочками",
            image: "p7",
            rating: "4.8",
            price: "399.0",
            discountPrice: "199.90",
            discount: nil,
            byWeight: false,
            badge: nil,
            country: "Германия 🇩🇪"
        ),
        Product(
            id: UUID(),
            title: "Ролл Маленькая Япония 216г",
            image: "p8",
            rating: "4.2",
            price: "399.0",
            discountPrice: "300.90",
            discount: "25%",
            byWeight: false,
            badge: .cardPrice,
            country: nil
        ),
    ]
}
