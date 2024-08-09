//
//  NavigationBarAppearance.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

final class NavigationBarAppearance: UINavigationBarAppearance {
    override init(barAppearance: UIBarAppearance) {
        super.init(barAppearance: barAppearance)
        
        configure()
    }
    override init(idiom: UIUserInterfaceIdiom = .unspecified) {
        super.init(idiom: idiom)
        
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureWithOpaqueBackground()
        
        backgroundColor = .white
        shadowColor = .gray
        shadowImage = UIImage()
    }
    
    static func setCustomAppearance() {
        let appearance = NavigationBarAppearance()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

