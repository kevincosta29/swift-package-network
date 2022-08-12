//
//  MockURLSession.swift
//
//
//  Created by Kevin Costa on 12/8/22.
//

import XCTest
@testable import KNetwork

@available(macOS 12.0, iOS 15.0, *)
final class KNetworkTests: XCTestCase {
    
    func test_invalidRequest() async {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        
        let response = await KNetwork.executeRequest(endpoint: MockEndpoint.invalidRequest, session: session)
        let invalidRequest = KNetworkError.invalidRequest
        
        switch response {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error, invalidRequest)
            XCTAssertEqual(error.description, invalidRequest.description)
        }
    }
    
    func test_invalidResponse() async {
        let session = MockURLSessionInvalidResponse()
        session.error = KNetworkError.invalidResponse
        let response = await KNetwork.executeRequest(endpoint: MockEndpoint.validRequest, session: session)
        
        switch response {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssert(!error.description.isEmpty)
        }
    }
    
    func test_successRequest() async {
        let session = MockURLSession()
        session.dataMock = "test_successRequest".data(using: .utf8)
        
        let response = await KNetwork.executeRequest(endpoint: MockEndpoint.validRequest, session: session)
        
        switch response {
        case .success(let response):
            XCTAssertEqual(String(data: response.data, encoding: .utf8), String(data: session.dataMock!, encoding: .utf8))
            XCTAssertEqual(response.statusCode, session.statusCode)
        case .failure(_):
            XCTFail()
        }
    }
    
    func test_successRequestJSON() async {
        let session = MockURLSession()
        session.dataMock = "test_successRequestJSON".data(using: .utf8)
        
        let response = await KNetwork.executeRequest(endpoint: MockEndpoint.contentTypeJson, session: session)
        
        switch response {
        case .success(let response):
            XCTAssertEqual(String(data: response.data, encoding: .utf8), String(data: session.dataMock!, encoding: .utf8))
            XCTAssertEqual(response.statusCode, session.statusCode)
        case .failure(_):
            XCTFail()
        }
    }
    
    func test_successRequestQueryItems() async {
        let session = MockURLSession()
        let items = "{\"item\": \"test\"}"
        session.dataMock = items.data(using: .utf8)
        
        let response = await KNetwork.executeRequest(endpoint: MockEndpoint.queryItems(items: items), session: session)
        
        switch response {
        case .success(let response):
            XCTAssertEqual(String(data: response.data, encoding: .utf8), String(data: session.dataMock!, encoding: .utf8))
            XCTAssertEqual(response.statusCode, session.statusCode)
        case .failure(_):
            XCTFail()
        }
    }
}
