//
//  Services.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 08/07/23.
//

import Foundation

class Services {
    
    private let storageService = StorageService()
    
    func storageSetItem(key: String, value: String) {
        return self.storageService.setItem(key, value)
    }
    
    func storageGetItem(key: String) -> String? {
        return self.storageService.getItem(key)
    }

    func storageRemoveItem(key: String) {
        return self.storageService.removeItem(key)
    }
    
    func storageKeys() -> [String] {
        return self.storageService.keys()
    }
    
    func storageClear() {
        return self.storageService.clear()
    }
    
}
