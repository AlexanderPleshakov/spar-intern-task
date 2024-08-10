//
//  ActionPanel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct ActionPanel: View {
    let onListTap: () -> Void
    let onFavouriteTap: () -> Void
    
    @State var isFavorite = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                onListTap()
            } label: {
                Image(uiImage: Images.orderList)
            }
            
            Button {
                onFavouriteTap()
                isFavorite.toggle()
            } label: {
                Image(
                    uiImage: isFavorite ? Images.favoritesActive : Images.favorites
                )
            }
        }
        .background(.white.opacity(0.9))
        .roundedCorners(0, 16, 0, 0)
    }
}
