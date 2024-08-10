//
//  CounterView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct CounterView: View {
    let minusAction: () -> Void
    let plusAction: () -> Void
    let count: String
    let totalPrice: String
    
    var body: some View {
        HStack {
            Button {
                minusAction()
            } label: {
                Image(uiImage: Images.minus)
            }
            
            Spacer()
            
            VStack(spacing: 0) {
                Text(count)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Colors.textStaticWhite01)
                Text(totalPrice)
                    .font(.system(size: 12))
                    .foregroundStyle(Colors.textStaticWhite02)
            }
            
            Spacer()
            
            Button {
                plusAction()
            } label: {
                Image(uiImage: Images.plus)
            }
        }
        .frame(height: 36)
        .frame(maxWidth: .infinity)
        .background(Colors.green)
        .roundedCorners(40, 40, 40, 40)
        .padding(.all, 4)
    }
}

