//
//  MarketScreen.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 08.08.2024.
//

import SwiftUI

struct MarketScreen: View {
    private let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible())
    ]
    
    @State var isGridLayout = true
    
    init(isGridLayout: Bool = true) {
        self.isGridLayout = isGridLayout
        NavigationBarAppearance.setCustomAppearance()
    }
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns) {
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    LayoutButton(isGridLayout: $isGridLayout)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

fileprivate struct LayoutButton: View {
    @Binding var isGridLayout: Bool
    var body: some View {
        HStack {
            Spacer()
                .frame(width: isGridLayout ? 0 : 8)
            Button {
                withAnimation {
                    isGridLayout.toggle()
                }
            } label: {
                Image(
                    uiImage: isGridLayout ? Images.gridLayout : Images.listLayout
                )
            }
            Spacer()
        }
    }
}

#Preview {
    MarketScreen()
}
