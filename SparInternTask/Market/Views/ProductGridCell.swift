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

struct PriceAndBuyView: View {
    let discountPrice: String
    let price: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 2) {
                    Text("1298")
                        .font(.system(size: 20, weight: .bold))
                    Text("90")
                        .font(.system(size: 16, weight: .bold))
                    Image(uiImage: Images.perAmount)
                        .padding(.vertical, 1)
                }
                Text("190,0")
                    .font(.system(size: 12))
                    .foregroundStyle(Colors.textIconsBlack03)
                    .strikethrough(true, color: Colors.textIconsBlack03)
            }
            Spacer()
            
            Button {
                action()
            } label: {
                Image(uiImage: Images.addCart)
            }
            .frame(width: 48, height: 36)
            .background(Colors.green)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 40,
                    style: .continuous
                )
            )
        }
        .padding(.all, 4)
    }
}

struct ProductNameView: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Colors.textIconsBlack02)
    }
}

struct DiscountView: View {
    let text: String
    var body: some View {
        Text(text)
            .padding(.horizontal, 5)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Colors.darkRed)
    }
}

fileprivate struct RatingView: View {
    let rating: String
    
    var body: some View {
        HStack(spacing: 2) {
            Image(uiImage: Images.star)
            Text(rating)
                .font(.system(size: 12))
                .padding(.vertical, 1)
                .foregroundStyle(Colors.textStatic)
        }
        .padding(.vertical, 2)
        .padding(.leading, 4)
    }
}

fileprivate struct ActionPanel: View {
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
