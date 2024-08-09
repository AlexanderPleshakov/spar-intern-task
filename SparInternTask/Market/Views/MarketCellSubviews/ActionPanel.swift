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
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                onListTap()
            } label: {
                Image(uiImage: Images.orderList)
            }
            
            Button {
                onListTap()
            } label: {
                Image(uiImage: Images.favorites)
            }
        }
        .background(.white.opacity(0.9))
        .roundedCorners(0, 16, 0, 0)
    }
}
