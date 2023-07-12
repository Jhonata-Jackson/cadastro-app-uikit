//
//  StorageService.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 07/07/23.
//

import Foundation

struct StorageService {

    private let storageEngine: UserDefaults
    private let KEY_PREFIX = "register_"

    init(storageEngine: UserDefaults) {
        self.storageEngine = storageEngine
    }
    
    func setItem(_ key: String, _ value: String) {
        self.storageEngine.set(value, forKey: "\(self.KEY_PREFIX)\(key)")
        self.storageEngine.synchronize()
    }
    
    func getItem(_ key: String) -> String? {
        return self.storageEngine.string(forKey: "\(self.KEY_PREFIX)\(key)")
    }

    func removeItem(_ key: String) {
        self.storageEngine.removeObject(forKey: "register_secondKey")
        self.storageEngine.synchronize()
    }
    
    func keys() -> [String] {
        let allData = self.storageEngine.dictionaryRepresentation()
        let keys = allData.keys
        
        return keys.filter { key in
            key.starts(with: self.KEY_PREFIX)
        }.map {
            $0.replacingOccurrences(of: KEY_PREFIX, with: "", options: .anchored)
        }
    }
    
    func clear() {
        let suiteName = Bundle.main.bundleIdentifier

        if let suiteName = suiteName {
           UserDefaults.standard.removePersistentDomain(forName: suiteName)
           UserDefaults.standard.synchronize()
           
           print(">> Storage cleared!")
        } else {
           print(">> Storage clear error!")
        }
    }
}
