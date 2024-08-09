//
//  Colors.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

enum Colors {
    static let green = Color(hex: "#15B742")
    
    static let badgeRed = Color(hex: "#FC6A6F").opacity(0.9)
    static let badgeGreen = Color(hex: "#5BCD7B").opacity(0.9)
    static let badgeBlue = Color(hex: "#7A79BA").opacity(0.9)
    
    static let textStatic = Color(.black).opacity(0.8)
    
    static let textIconsBlack01 = Color(hex: "#262626")
    static let textIconsBlack02 = Self.textIconsBlack01.opacity(0.8)
    static let textIconsBlack03 = Color(hex: "#7D7D7D")
    
    static let darkRed = Color(hex: "#C32323")
    
    static let shadowDark = Color(hex: "#8B8B8B").opacity(0.2)
}
