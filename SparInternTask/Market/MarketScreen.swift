//
//  MarketScreen.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 08.08.2024.
//

import SwiftUI

struct MarketScreen: View {
    private let gridColumns = [
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible())
    ]
    
    @ObservedObject var viewModel: MarketViewModel
    
    init(viewModel: MarketViewModel) {
        self.viewModel = viewModel
        NavigationBarAppearance.setCustomAppearance()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.layoutState {
                case .grid:
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 8) {
                            ForEach(viewModel.products) {
                                ProductGridCell(
                                    viewModel: MarketCellViewModel(
                                        product: $0
                                    )
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 9)
                        .padding(.bottom, 30)
                    }
                case .list:
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
                            ForEach(viewModel.products) {
                                ProductListCell(
                                    viewModel: MarketCellViewModel(
                                        product: $0
                                    )
                                )
                            }
                        }
                        .padding(.bottom, 30)
                    }
                }
                
                Spacer()
            }
            .ignoresSafeArea(.container, edges: .bottom)
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
