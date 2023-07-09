//
//  Parse.swift
//  CadastroApp
//
//  Created by Jhonata Jackson on 08/07/23.
//

enum ParseError: Error {
    case failedParseStringToData
}

import Foundation

func parseJsonToModel<T: Codable>(json: String, model: T.Type) throws -> T {
    guard let data = json.data(using: .utf8) else {
        throw ParseError.failedParseStringToData
    }
    
    return try JSONDecoder().decode(T.self, from: data)
}
