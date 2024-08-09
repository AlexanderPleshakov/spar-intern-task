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
                    ActionPanel(onListTap: {}, onFavouriteTap: {})
                }
                .overlay(alignment: .bottomLeading) {
                    RatingView(rating: "5.0")
                }
                .overlay(alignment: .bottomTrailing) {
                    DiscountView(text: "25%")
                }
            
            ProductNameView(name: viewModel.product.title)
                .padding(.all, 8)
            
            Spacer()
            
            PriceAndBuyView(discountPrice: "367.90", price: "199,0") {
                
            }
        }
        .frame(width: 168, height: 278)
        .background(.white)
        .roundedCorners(16, 20, 20, 16)
        .shadow(color: Colors.shadowDark, radius: 8)
    }
}

#Preview {
    ProductGridCell(
        viewModel: MarketCellViewModel(
            product: Product(
                id: UUID(),
                title: "Дорадо Охлажденная Непотрошеная 300-400г",
                rating: "4.1",
                price: "199.0",
                discountPrice: "99.90",
                discount: "12 %",
                byWeight: false,
                badge: BadgeType.new
            )
        )
    )
}
