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
        let services = Services()
        services.storageClear()

        let firstKey = "firstKey"
        let userModel = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let jsonData = try JSONEncoder().encode(userModel)

        services.storageSetItem(key: firstKey, value:  String(data: jsonData, encoding: .utf8)!)

        let result = services.storageGetItem(key: firstKey)
        let resultModel = try parseJsonToModel(json: result!, model: UserModel.self)
        let storageKeys = services.storageKeys()

        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(resultModel.name, "user")
        XCTAssertEqual(resultModel.email, "user@gmail.com")
        XCTAssertEqual(resultModel.password, "123456")
    }
    
    func testRemoveUserRegister() throws {
        let services = Services()

        let firstKey = "firstKey"
        let secondKey = "secondKey"
        let firstUser = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let secondUser = UserModel(name: "user", email: "user@gmail.com", password: "123456")
        let firstJsonData = try JSONEncoder().encode(firstUser)
        let secondJsonData = try JSONEncoder().encode(secondUser)
        
        services.storageClear()
        services.storageSetItem(key: firstKey, value: String(data: firstJsonData, encoding: .utf8)!)
        services.storageSetItem(key: secondKey, value: String(data: secondJsonData, encoding: .utf8)!)
    
        let firstResult = services.storageGetItem(key: firstKey)
        let firstResultModel = try parseJsonToModel(json: firstResult!, model: UserModel.self)
        let secondResult = services.storageGetItem(key: secondKey)
        let secondResultModel = try parseJsonToModel(json: secondResult!, model: UserModel.self)
        var storageKeys = services.storageKeys()
        
        XCTAssertTrue(storageKeys.count == 2)
        XCTAssertEqual(firstResultModel.name, firstUser.name)
        XCTAssertEqual(firstResultModel.email, firstUser.email)
        XCTAssertEqual(firstResultModel.password, firstUser.password)
        
        XCTAssertEqual(secondResultModel.name, firstUser.name)
        XCTAssertEqual(secondResultModel.email, firstUser.email)
        XCTAssertEqual(secondResultModel.password, firstUser.password)
        
        services.storageRemoveItem(key: secondKey)
        storageKeys = services.storageKeys()
        
        XCTAssertTrue(storageKeys.count == 1)
        XCTAssertEqual(firstResultModel.name, firstUser.name)
        XCTAssertEqual(firstResultModel.email, firstUser.email)
        XCTAssertEqual(firstResultModel.password, firstUser.password)
    }
}

