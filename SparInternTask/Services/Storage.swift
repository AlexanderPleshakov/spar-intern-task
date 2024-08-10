//
//  Storage.swift
//  SparInternTask
//
//  Created by Александр Плешаков on 10.08.2024.
//

import Foundation

final class Storage {
    func add(id: String, multiply: Int, unit: String) {
        UserDefaults.standard.setValue([multiply, unit], forKey: id)
    }
    
    func delete(id: String) {
        UserDefaults.standard.removeObject(forKey: id)
    }
    
    func fetchProduct(id: String) -> (Int, String)? {
        if let data = UserDefaults.standard.object(forKey: id) as? [Any],
           let multiply = data[0] as? Int,
           let unit = data[1] as? String {
            return (multiply, unit)
        }
        return nil
    }
}
