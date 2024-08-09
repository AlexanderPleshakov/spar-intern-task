//
//  PriceAndBuyView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct PriceAndBuyView: View {
    @ObservedObject var viewModel: PriceAndBuyViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 2) {
                    Text(viewModel.detailPrice?.0 ?? "")
                        .font(.system(size: 20, weight: .bold))
                    Text(viewModel.detailPrice?.1 ?? "")
                        .font(.system(size: 16, weight: .bold))
                    Image(uiImage: Images.perAmount)
                        .padding(.vertical, 1)
                }
                if viewModel.type == .withDiscount {
                    Text(viewModel.price)
                        .font(.system(size: 12))
                        .foregroundStyle(Colors.textIconsBlack03)
                        .strikethrough(true, color: Colors.textIconsBlack03)
                }
            }
            Spacer()
            
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    viewModel.buy()
                }
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
