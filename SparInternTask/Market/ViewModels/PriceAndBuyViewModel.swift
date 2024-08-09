//
//  PriceAndBuyViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

enum PriceAndBuyViewType {
    case withDiscount, usual
}

final class PriceAndBuyViewModel: ObservableObject {
    var action:  (() -> Void)?
    private let discountPrice: String?
    let price: String
    
    var type: PriceAndBuyViewType {
        guard discountPrice != nil else { return .usual }
        return .withDiscount
    }
    
    var detailPrice: (String, String)? {
        switch type {
        case .withDiscount:
            getDetailPrice(from: discountPrice)
        case .usual:
            getDetailPrice(from: price)
        }
        
    }
    
    init(discountPrice: String?, price: String) {
        self.price = price
        self.discountPrice = discountPrice
    }
    
    func buy() {
        (action ?? {})()
    }
    
    private func getDetailPrice(from price: String?) -> (String, String)? {
        guard let price else { return nil }
        let dotIndex = price.firstIndex { char in
            char == "."
        } ?? price.endIndex
        let firstPart = price.prefix { character in
            character != "."
        }
        let secondPart = price.suffix(from: price.index(after: dotIndex))
        
        return (String(firstPart), String(secondPart))
    }
}
