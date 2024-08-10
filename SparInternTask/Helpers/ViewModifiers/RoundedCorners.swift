//
//  RoundedCorners.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

fileprivate struct RoundedCorners: ViewModifier {
    let topLeading: CGFloat
    let bottomLeading: CGFloat
    let bottomTrailing: CGFloat
    let topTrailing: CGFloat
    
    init(
        _ topLeading: CGFloat = 0,
        _ bottomLeading: CGFloat = 0,
        _ bottomTrailing: CGFloat = 0,
        _ topTrailing: CGFloat = 0
    ) {
        self.topLeading = topLeading
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
        self.topTrailing = topTrailing
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(
                .rect(
                    topLeadingRadius: topLeading,
                    bottomLeadingRadius: bottomLeading,
                    bottomTrailingRadius: bottomTrailing,
                    topTrailingRadius: topTrailing
                )
            )
    }
}
extension View {
    func roundedCorners(_ topLeading: CGFloat = 0,
                      _ bottomLeading: CGFloat = 0,
                      _ bottomTrailing: CGFloat = 0,
                      _ topTrailing: CGFloat = 0)
    -> some View {
        self.modifier(
            RoundedCorners(topLeading, bottomLeading, bottomTrailing, topTrailing)
        )
    }
}
