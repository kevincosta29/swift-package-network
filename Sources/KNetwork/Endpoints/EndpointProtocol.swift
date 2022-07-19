//
//  EndpointProtocol.swift
//  
//
//  Created by Kevin Costa on 19/7/22.
//

import Foundation

public protocol KEndpointProtocol {
    
    var scheme: String { get }
    var urlBase: String { get }
    var path: String { get }
    var parametersBody: Data? { get }
    var method: KURLMethod { get }
    var contentType: KContentType { get }
    var headers: [String: String] { get }
    var port: Int { get }
    var encoding: KEncoding { get }
    
}

public enum KEncoding {
    case json
    case urlEncoding(params: Data?)
    
    var urlEncodingItems: [URLQueryItem]? {
        switch self {
        case .urlEncoding(let p):
            guard let params = p else { return nil }
            let dictParams = try? JSONSerialization.jsonObject(with: params, options: []) as? [String: Any]
            var queryItems = [URLQueryItem]()
            dictParams?.forEach({ key, value in
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            })
            return queryItems
        default:
            return nil
        }
    }
}

public enum KContentType: String {
    case json = "application/json"
    case multipart = "multipart/form-data"
}

public enum KURLMethod: String {
    case GET
    case POST
    case PUT
}

