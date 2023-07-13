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
        let sut = StorageService(storageEngine: UserDefaults.standard)

        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstValue = "firstValue"
        let secondValue = "secondValue"

        sut.clear()
        sut.setItem(firstKey, firstValue)
        sut.setItem(secondKey, secondValue)

        let firstResult = sut.getItem(firstKey)
        let secondResult = sut.getItem(secondKey)
        let storageKeys = sut.keys()

        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResult, firstValue)
        XCTAssertEqual(secondResult, secondValue)
    }
    
    func testRemoveDataOnStorage() throws {
        let sut = StorageService(storageEngine: UserDefaults.standard)
        
        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstValue = "firstValue"
        let secondValue = "secondValue"
        
        sut.clear()
        sut.setItem(firstKey, firstValue)
        sut.setItem(secondKey, secondValue)
    
        let firstResult = sut.getItem(firstKey)
        let secondResult = sut.getItem(secondKey)
        var storageKeys = sut.keys()
        
        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResult, firstValue)
        XCTAssertEqual(secondResult, secondValue)
        
        sut.removeItem(secondKey)
        storageKeys = sut.keys()
        
        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(firstResult, firstValue)
    }
}

