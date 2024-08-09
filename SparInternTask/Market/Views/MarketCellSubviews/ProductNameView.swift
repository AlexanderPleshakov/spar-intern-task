//
//  ProductNameView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

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
