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

    private init() {
        userDefaults = UserDefaults.standard
    }
    
    private func prepareKey(_ key: String) -> String {
        return "\(self.KEY_PREFIX)\(key)"
    }
    
    func setItem(key: String, value: String) {
        self.userDefaults.set(value, forKey: self.prepareKey(key))
        self.userDefaults.synchronize()
    }
    
    func getItem(key: String) -> String? {
        return self.userDefaults.string(forKey: self.prepareKey(key))
    }

    func removeItem(key: String) {
        self.userDefaults.removeObject(forKey: self.prepareKey(key))
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
           
           print(">> Storage has been successfully cleared!")
        } else {
           print(">> Invalid suit identifier of UserDefaults.")
        }
    }
}
