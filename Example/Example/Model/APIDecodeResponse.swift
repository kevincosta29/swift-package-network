//
//  APIDecodeResponse.swift
//  Example
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation

struct WSListCharacters: Decodable {
    var results: [Character]?
}

// MARK: - Base error response

struct WSErrorResponse: Codable {
    
    var code                : String?
    var message             : String?
    var description         : String {
        return "Code: \(code ?? "") - Message: \(message ?? "")"
    }
    
    private enum CodingKeys: String, CodingKey {
        case code
        case message
    }
    
}
