//
//  MarketScreen.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 08.08.2024.
//

import SwiftUI

struct MarketScreen: View {
    private let columns = [
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible())
    ]
    
    
    @ObservedObject var viewModel: MarketViewModel
    
    init(viewModel: MarketViewModel, isGridLayout: Bool = true) {
        self.viewModel = viewModel
        NavigationBarAppearance.setCustomAppearance()
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.layoutState {
                case .grid:
                    LazyVGrid(columns: columns, spacing: 8) {
                        ProductGridCell(
                            viewModel: MarketCellViewModel(
                                product: Product(
                                    id: UUID(),
                                    title: "Дорадо Охлажденная Непотрошеная 300-400г",
                                    image: "p3",
                                    rating: "4.1",
                                    price: "199.0",
                                    discountPrice: "99.90",
                                    discount: "12 %",
                                    byWeight: false,
                                    badge: BadgeType.new,
                                    country: "Франция 🇫🇷"
                                )
                            )
                        )
                    }
                case .list:
                    List {}
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    LayoutButton(onTap: viewModel.changeState, layout: viewModel.layoutState)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

fileprivate struct LayoutButton: View {
    let onTap: () -> Void
    let layout: MarketLayoutState
    @State var isGridLayout: Bool
    
    init(onTap: @escaping () -> Void, layout: MarketLayoutState) {
        self.onTap = onTap
        self.layout = layout
        self.isGridLayout = layout == .grid
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: isGridLayout ? 0 : 8)
            Button {
                withAnimation(.easeIn(duration: 0.1)) {
                    isGridLayout.toggle()
                }
                onTap()
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
    MarketScreen(viewModel: MarketViewModel())
}
