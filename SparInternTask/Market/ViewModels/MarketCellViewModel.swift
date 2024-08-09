//
//  MarketCellViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

final class MarketCellViewModel: ObservableObject {
    let product: Product
    let storage: Storage
    lazy var unitPickerViewModel = UnitPickerViewModel(onUpdate: updateCounts)
    
    @Published var priceAndBuyViewModel: PriceAndBuyViewModel
    @Published var bought: Bool
    @Published var unitsCount: String = "0.1 кг"
    @Published var totalPrice: String = ""
    
    private var multiply = 1
    private var unit: String = "Кг"
    
    init(product: Product) {
        self.product = product
        self.storage = Storage()
        if let (multiply, unit) = storage.fetchProduct(id: product.id) {
            self.bought = true
            self.multiply = multiply
            self.unit = unit
        } else {
            self.bought = false
        }
        
        self.priceAndBuyViewModel = PriceAndBuyViewModel(
            discountPrice: product.discountPrice,
            price: product.price
        )
        priceAndBuyViewModel.action = { [weak self] in
            guard let self else { return }
            self.bought = true
            
            updateCounts()
            storage.add(
                id: product.id,
                multiply: multiply,
                unit: unit
            )
        }
        
        unitPickerViewModel.select(unit: unit)
        updateTotalPrice()
        updateUnits()
    }
    
    func addCount() {
        multiply += 1
        updateCounts()
    }
    
    func minusCount() {
        multiply -= 1
        if multiply <= 0 {
            withAnimation(.easeIn(duration: 0.2)) {
                bought = false
            }
            multiply = 1
            updateCounts()
            storage.delete(id: product.id)
            return
        }
        updateCounts()
    }
    
    private func updateCounts() {
        updateUnits()
        updateTotalPrice()
        
        storage.add(
            id: product.id,
            multiply: multiply,
            unit: unit
        )
    }
    
    private func updateUnits() {
        switch unitPickerViewModel.selectedUnit {
        case "Кг":
            unit = "Кг"
            unitsCount = "\(String(format: "%.1f", Double(multiply) / 10.0)) кг"
        case "Шт":
            unit = "Шт"
            unitsCount = "\(multiply) шт"
        default:
            break
        }
    }
    
    private func updateTotalPrice() {
        guard let price = Double(product.discountPrice ?? product.price) else {
            return
        }
        let totalPrice = price * Double(multiply)
        self.totalPrice = "~\(String(format: "%.1f", totalPrice)) ₽"
    }
}
