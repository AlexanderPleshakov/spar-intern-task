//
//  SparInternTaskApp.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 08.08.2024.
//

import SwiftUI

@main
struct SparInternTaskApp: App {
    @StateObject var marketViewModel = MarketViewModel()
    var body: some Scene {
        WindowGroup {
            MarketScreen(viewModel: marketViewModel)
        }
    }
}
