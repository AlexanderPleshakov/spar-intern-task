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
            Image(viewModel.product.image, bundle: nil)
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
            
            VStack(alignment: .leading, spacing: 4) {
                ProductNameView(name: viewModel.product.title)
                CountryView(country: viewModel.product.country)
            }
            .padding([.top, .horizontal], 8)
            
            Spacer()
            UnitPicker(viewModel: viewModel.unitPickerViewModel)
            
            PriceAndBuyView(discountPrice: "367.90", price: "199,0") {
                
            }
        }
        .frame(width: 168, height: 300)
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
                image: "p1",
                rating: "4.1",
                price: "199.0",
                discountPrice: "99.90",
                discount: "12 %",
                byWeight: false,
                badge: BadgeType.new,
                country: "Франция 🇫🇷"
            )
        )
    )
}
