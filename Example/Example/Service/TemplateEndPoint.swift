//
//  TemplateEndPoint.swift
//  Example
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation
import KNetwork

enum TemplateEndpoint: KEndpointProtocol {
    
    case wsListCharacters
    
    var scheme: String { "https" }
    
    var port: Int { 443 }
    
    var urlBase: String { "rickandmortyapi.com" }
    
    var path: String {
        switch self {
        case .wsListCharacters:
            return "/api/character"
        }
    }
    
    var parametersBody: Data? { nil }
    
    var encoding: KEncoding {
        return .urlEncoding(params: self.parametersBody)
    }
    
    var method: KURLMethod {
        switch self {
        case .wsListCharacters:
            return .GET
        }
    }
    
    var contentType: KContentType { .json }
    
    var headers: [String : String] { [:] }
    
}
