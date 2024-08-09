//
//  Storage.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 10.08.2024.
//

import Foundation

final class Storage {
    func add(id: String) {
        UserDefaults.standard.setValue(true, forKey: id)
    }
    
    func delete(id: String) {
        UserDefaults.standard.removeObject(forKey: id)
    }
    
    func inCart(id: String) -> Bool {
        if let _ = UserDefaults.standard.object(forKey: id) {
            return true
        }
        return false
    }
}
