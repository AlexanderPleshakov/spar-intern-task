//
//  ProductGridCell.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct ProductGridCell: View {
    let viewModel: MarketCellViewModel
    var body: some View {
        VStack {
            Image("p1", bundle: nil)
                .overlay(alignment: .topLeading) {
                    Badge(badge: viewModel.product.badge)
                }
                .overlay(alignment: .topTrailing) {
                    actionPanel(onListTap: {}, onFavouriteTap: {})
                }
        }
        .roundedCorners(16, 20, 20, 16)
    }
}

fileprivate struct actionPanel: View {
    let onListTap: () -> Void
    let onFavouriteTap: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                onListTap()
            } label: {
                Image(uiImage: Images.orderList)
            }
            
            Button {
                onListTap()
            } label: {
                Image(uiImage: Images.favorites)
            }
        }
        .background(.white.opacity(0.9))
        .roundedCorners(0, 16, 0, 0)
    }
}

fileprivate struct Badge: View {
    let badge: BadgeType?
    let color: Color
    
    init(badge: BadgeType?) {
        self.badge = badge
        switch badge {
        case .priceHit:
            self.color = Colors.badgeRed
        case .new:
            self.color = Colors.badgeBlue
        case .cardPrice:
            self.color = Colors.badgeGreen
        case nil:
            self.color = .clear
        }
    }
    
    var body: some View {
        if let badge {
            Text(badge.rawValue)
                .padding(.leading, 12)
                .padding(.top, 2)
                .padding(.bottom, 4)
                .padding(.trailing, 6)
                .font(.system(size: 10))
                .foregroundStyle(.white)
                .background(color)
                .roundedCorners(0, 0, 6, 6)
        }
        
    }
}

#Preview {
    ProductGridCell(
        viewModel: MarketCellViewModel(
            product: Product(
                id: UUID(),
                title: "Сыр Ламбер 500/0 230г",
                rating: 4.1,
                price: 199.0,
                discountPrice: 99.90,
                discount: nil,
                byWeight: false,
                badge: BadgeType.new
            )
        )
    )
}
