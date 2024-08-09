//
//  RatingView.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct RatingView: View {
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
