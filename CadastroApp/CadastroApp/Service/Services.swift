//
//  Services.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 08/07/23.
//

import Foundation

class Services {
    
    private let storageService = StorageService(storageEngine: UserDefaults.standard)
    
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

    func getAllRegisters() throws -> [UserModel]? {
        let keys = self.storageKeys()
        
        if(keys.count > 0) {
            return try keys.map {
                self.storageGetItem(key: $0)!
            }.map {
                let jsonData = Data($0.utf8)
            
                let people = try JSONDecoder().decode(UserModel.self, from: jsonData)
                return people
            }
        }
        
        return []
    }
    
}
