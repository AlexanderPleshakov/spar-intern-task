//
//  Badge.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct Badge: View {
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
