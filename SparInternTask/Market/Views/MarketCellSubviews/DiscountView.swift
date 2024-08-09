//
//  DiscountView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct DiscountView: View {
    let text: String
    var body: some View {
        Text(text)
            .padding(.horizontal, 5)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Colors.darkRed)
    }
}
