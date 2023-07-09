//
//  StorageServiceTest.swift
//  CadastroAppTests
//
//  Created by Jhonata Jackson on 08/07/23.
//

import XCTest
@testable import CadastroApp

final class StorageServiceTest: XCTestCase {
    
    func testSaveDataOnStorage() throws {
        let services = Services()

        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstValue = "firstValue"
        let secondValue = "secondValue"

        services.storageClear()
        services.storageSetItem(key: firstKey, value: firstValue)
        services.storageSetItem(key: secondKey, value: secondValue)

        let firstResult = services.storageGetItem(key: firstKey)
        let secondResult = services.storageGetItem(key: secondKey)
        let storageKeys = services.storageKeys()

        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResult, firstValue)
        XCTAssertEqual(secondResult, secondValue)
    }
    
    func testRemoveDataOnStorage() throws {
        let storageService = StorageService(storageEngine: UserDefaults.standard)
        
        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstValue = "firstValue"
        let secondValue = "secondValue"
        
        storageService.clear()
        storageService.setItem(firstKey, firstValue)
        storageService.setItem(secondKey, secondValue)
    
        let firstResult = storageService.getItem(firstKey)
        let secondResult = storageService.getItem(secondKey)
        var storageKeys = storageService.keys()
        
        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResult, firstValue)
        XCTAssertEqual(secondResult, secondValue)
        
        storageService.removeItem(secondKey)
        storageKeys = storageService.keys()
        
        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(firstResult, firstValue)
    }
}

