//
//  StorageService.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 07/07/23.
//

import Foundation

struct StorageService {
    static let shared = StorageService()

    private let userDefaults: UserDefaults
    private let KEY_PREFIX = "register_"

    init() {
        userDefaults = UserDefaults.standard
    }
    
    func setItem(_ key: String, _ value: String) {
        self.userDefaults.set(value, forKey: "\(self.KEY_PREFIX)\(key)")
        self.userDefaults.synchronize()
    }
    
    func getItem(_ key: String) -> String? {
        return self.userDefaults.string(forKey: "\(self.KEY_PREFIX)\(key)")
    }

    func removeItem(_ key: String) {
        self.userDefaults.removeObject(forKey: "\(self.KEY_PREFIX)\(key)")
        self.userDefaults.synchronize()
    }
    
    func keys() -> [String] {
        let allData = self.userDefaults.dictionaryRepresentation()
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
