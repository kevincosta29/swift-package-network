//
//  MockEndpoint.swift
//  
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation

@testable import KNetwork

enum MockEndpoint: KEndpointProtocol {
    
    case invalidRequest
    case validRequest
    case contentTypeJson
    case queryItems(items: String)
    
    var scheme: String {
        "https"
    }
    
    var urlBase: String {
        "mock.endpoint"
    }
    
    var path: String {
        switch self {
        case .invalidRequest:
            return "invalidPath"
        case .validRequest, .contentTypeJson, .queryItems:
            return "/validRequest"
        }
    }
    
    var parametersBody: Data? {
        switch self {
        case .queryItems(let items):
            return items.data(using: .utf8)
        default:
            return nil
        }
    }
    
    var method: KURLMethod {
        switch self {
        case .invalidRequest, .validRequest:
            return .POST
        case .contentTypeJson:
            return .PUT
        case .queryItems:
            return .GET
        }
    }
    
    var contentType: KContentType {
        switch self {
        case .validRequest:
            return .multipart
        default:
            return .json
        }
    }
    
    var headers: [String : String] {
        ["Test header": "Test header value"]
    }
    
    var port: Int {
        100
    }
    
    var encoding: KEncoding {
        switch self {
        case .queryItems:
            return .urlEncoding(params: self.parametersBody)
        default:
            return .json
        }
    }
    
}
