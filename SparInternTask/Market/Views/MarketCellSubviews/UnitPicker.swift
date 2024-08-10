//
//  UnitPicker.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

struct UnitPicker: View {
    @ObservedObject var viewModel: UnitPickerViewModel
    
    var body: some View {
        ZStack(alignment: viewModel.pickerAlignment) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 28)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .frame(width: 77, height: 24)
                .padding(.all, 2)
        }
        .padding(.horizontal, 5)
        .overlay {
            HStack {
                ForEach(viewModel.units, id: \.self) { unit in
                    Text(unit)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(viewModel.selectedUnit == unit ? .black : .gray)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                viewModel.select(unit: unit)
                            }
                        }
                }
            }
            .frame(height: 28)
            .frame(maxWidth: .infinity)
            .background(.clear)
            .padding(.horizontal, 5)
        }
    }
}
