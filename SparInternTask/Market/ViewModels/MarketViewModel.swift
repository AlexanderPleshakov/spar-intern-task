//
//  MarketViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import Foundation

enum MarketLayoutState {
    case grid, list
}

final class MarketViewModel: ObservableObject {
    @Published var layoutState: MarketLayoutState = .list
    @Published var products = Mocks.products
    
    func changeState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self else { return }
            layoutState = layoutState == .grid ? .list : .grid
        }
    }
}
