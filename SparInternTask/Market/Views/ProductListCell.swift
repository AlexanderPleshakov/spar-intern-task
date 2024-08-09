//
//  ProductListCell.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct ProductListCell: View {
    @ObservedObject var viewModel: MarketCellViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Colors.separatorGray)
                .frame(height: 1)
            
            HStack(spacing: 8) {
                Group {
                    Image(viewModel.product.image, bundle: nil)
                        .resizable()
                        .frame(width: 144, height: 144)
                        .overlay(alignment: .bottomTrailing) {
                            DiscountView(text: viewModel.product.discount ?? "")
                        }
                        .overlay(alignment: .topLeading) {
                            Badge(badge: viewModel.product.badge)
                        }
                        .roundedCorners(8, 8, 8, 8)
                    
                    
                    VStack {
                        
                        HStack(alignment: .top, spacing: 0) {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(spacing: 4) {
                                    RatingView(rating: viewModel.product.rating)
                                    
                                    Rectangle()
                                        .fill(Colors.textIconsBlack03)
                                        .frame(width: 1, height: 16)
                                    
                                    Text("19 отзывов")
                                        .font(.system(size: 12))
                                        .foregroundStyle(Colors.textIconsBlack03)
                                }
                                ProductNameView(name: viewModel.product.title)
                                    .padding(.horizontal, 8)
                                CountryView(country: viewModel.product.country)
                                    .padding(.horizontal, 8)
                            }
                            ActionPanel(onListTap: {}, onFavouriteTap: {})
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                        Spacer()
                        
                        Group {
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
                        .padding(.leading, 4)
                    }
                    .frame(height: 144)
                }
                .padding([.leading, .vertical], 16)
                .padding(.trailing, 8)
            } // HStack
        } // VStack
    }
}

#Preview {
    ProductListCell(
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
