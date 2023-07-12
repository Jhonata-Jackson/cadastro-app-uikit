//
//  StorageServiceTest.swift
//  CadastroAppTests
//
//  Created by Jhonata Jackson on 09/07/23.
//

import XCTest
@testable import CadastroApp

final class UserRegisterTest: XCTestCase {
    
    func testUserRegister() throws {
        let sut = Services()
        sut.storageClear()

        let firstKey = "firstKey"
        let userModel = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let jsonData = try JSONEncoder().encode(userModel)

        sut.storageSetItem(key: firstKey, value:  String(data: jsonData, encoding: .utf8)!)

        let result = sut.storageGetItem(key: firstKey)
        let resultModel = try parseJsonToModel(json: result!, model: UserModel.self)
        let storageKeys = sut.storageKeys()

        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(resultModel.name, "user")
        XCTAssertEqual(resultModel.email, "user@gmail.com")
        XCTAssertEqual(resultModel.password, "123456")
    }
    
    func testRemoveUserRegister() throws {
        let sut = Services()

        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstUser = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let secondUser = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let firstJsonData = try JSONEncoder().encode(firstUser)
        let secondJsonData = try JSONEncoder().encode(secondUser)
        
        sut.storageClear()
        sut.storageSetItem(key: firstKey, value: String(data: firstJsonData, encoding: .utf8)!)
        sut.storageSetItem(key: secondKey, value: String(data: secondJsonData, encoding: .utf8)!)
    
        let firstResult = sut.storageGetItem(key: firstKey)
        let firstResultModel = try parseJsonToModel(json: firstResult!, model: UserModel.self)
        let secondResult = sut.storageGetItem(key: secondKey)
        let secondResultModel = try parseJsonToModel(json: secondResult!, model: UserModel.self)
        var storageKeys = sut.storageKeys()
        
        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResultModel.name, firstUser.name)
        XCTAssertEqual(firstResultModel.email, firstUser.email)
        XCTAssertEqual(firstResultModel.password, firstUser.password)
        
        XCTAssertEqual(secondResultModel.name, firstUser.name)
        XCTAssertEqual(secondResultModel.email, firstUser.email)
        XCTAssertEqual(secondResultModel.password, firstUser.password)
        
        sut.storageRemoveItem(key: secondKey)
        storageKeys = sut.storageKeys()
        
        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(firstResultModel.name, firstUser.name)
        XCTAssertEqual(firstResultModel.email, firstUser.email)
        XCTAssertEqual(firstResultModel.password, firstUser.password)
    }
}

