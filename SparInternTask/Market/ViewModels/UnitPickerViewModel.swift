//
//  UnitPickerViewModel.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 09.08.2024.
//

import SwiftUI

final class UnitPickerViewModel: ObservableObject {
    let units = ["Шт", "Кг"]
    let onUpdate: () -> Void
    @Published var selectedUnit: String = "Кг"
    @Published var pickerAlignment: Alignment = .trailing
    
    init(onUpdate: @escaping () -> Void) {
        self.onUpdate = onUpdate
    }
    
    func select(unit: String) {
        if selectedUnit != unit {
            selectedUnit = unit
            pickerAlignment = pickerAlignment == .trailing ? .leading : .trailing
            onUpdate()
        }
    }
}


