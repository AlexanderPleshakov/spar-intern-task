//
//  ProductGridCell.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct ProductGridCell: View {
    @ObservedObject var viewModel: MarketCellViewModel
    
    var body: some View {
        VStack {
            Image(viewModel.product.image, bundle: nil)
                .overlay(alignment: .bottomLeading) {
                    RatingView(rating: viewModel.product.rating)
                }
                .overlay(alignment: .bottomTrailing) {
                    DiscountView(text: viewModel.product.discount ?? "")
                }
            
            VStack(alignment: .leading, spacing: 4) {
                ProductNameView(name: viewModel.product.title)
                CountryView(country: viewModel.product.country)
            }
            .padding([.top, .horizontal], 8)
            
            Spacer()
            
            if viewModel.bought {
                UnitPicker(viewModel: viewModel.unitPickerViewModel)
                
                CounterView(
                    minusAction: viewModel.minusCount,
                    plusAction: viewModel.addCount,
                    count: viewModel.unitsCount,
                    totalPrice: viewModel.totalPrice
                )
            } else {
                PriceAndBuyView(viewModel: viewModel.priceAndBuyViewModel)
            }
        }
        .frame(height: 300)
        .overlay(alignment: .topLeading) {
            Badge(badge: viewModel.product.badge)
        }
        .overlay(alignment: .topTrailing) {
            ActionPanel(onListTap: {}, onFavouriteTap: {})
        }
        .background(.white)
        .roundedCorners(16, 20, 20, 16)
        .shadow(color: Colors.shadowDark, radius: 8)
        
    }
}

#Preview {
    ProductGridCell(
        viewModel: MarketCellViewModel(
            product: Product(
                id: "1",
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
