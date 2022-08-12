//
//  KNetworkError.swift
//  
//
//  Created by Kevin Costa on 19/7/22.
//

import Foundation

public enum KNetworkError: Error, Equatable {
    
    case error(message: String)
    case parserError(message: String)
    case invalidRequest
    case invalidResponse
    case badRequest(message: String)
    case unAuthorized(message: String)
    case internalServerError(message: String)
    
    public var description: String {
        switch self {
        case .error(let message), .parserError(let message), .badRequest(let message), .unAuthorized(let message), .internalServerError(let message):
            return message
        case .invalidResponse:
            return "Invalid Response Error"
        case .invalidRequest:
            return "Invalid Request Error"
        }
    }
    
}
