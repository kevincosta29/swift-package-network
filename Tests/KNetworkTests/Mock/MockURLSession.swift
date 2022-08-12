//
//  MockURLSession.swift
//  
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation
import KNetwork

final public class MockURLSession: URLSession {
    
    var dataMock: Data?
    var statusCode: Int = 200
    var error: Error?
    
    public override var configuration: URLSessionConfiguration {
        return .default
    }
    
    public override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let response = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: request.allHTTPHeaderFields!)
        completionHandler(dataMock, response, error)
        return URLSession.shared.dataTask(with: request.url!)
    }
    
}

final public class MockURLSessionInvalidResponse: URLSession {
    
    var dataMock: Data?
    var statusCode: Int = 200
    var error: Error?
    
    public override var configuration: URLSessionConfiguration {
        return .default
    }
    
    public override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(dataMock, nil, error)
        return URLSession.shared.dataTask(with: request.url!)
    }
    
}
