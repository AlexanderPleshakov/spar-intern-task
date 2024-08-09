//
//  CountryView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct CountryView: View {
    let country: String?
    var body: some View {
        if let country {
            Text(country)
                .foregroundStyle(Colors.textIconsBlack03)
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

