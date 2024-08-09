//
//  PriceAndBuyView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

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
