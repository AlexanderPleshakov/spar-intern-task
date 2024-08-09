//
//  MarketCellViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

final class MarketCellViewModel: ObservableObject {
    let product: Product
    
    @Published var selectedPrice: Double?
    @Published var selectedWeight: Double?
    
    init(product: Product) {
        self.product = product
    }
    
    func buy() {
        
    }
    
    func changeWeight(_ operator: WeightOperator) {
        
    }
}
