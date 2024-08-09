//
//  MarketCellViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

final class MarketCellViewModel: ObservableObject {
    let product: Product
    lazy var unitPickerViewModel = UnitPickerViewModel()
    
    @Published var priceAndBuyViewModel: PriceAndBuyViewModel
    @Published var selectedPrice: Double?
    @Published var selectedWeight: Double?
    
    init(product: Product) {
        self.product = product
        self.priceAndBuyViewModel = PriceAndBuyViewModel(
            discountPrice: product.discountPrice,
            price: product.price,
            action: {
                
            }
        )
    }
    
    func buy() {
        
    }
    
    func changeWeight(_ operator: WeightOperator) {
        
    }
}
