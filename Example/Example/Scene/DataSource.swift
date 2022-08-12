//
//  DataSource.swift
//  Example
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation
import KNetwork

final class DataSource {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func fetchContent() async -> (Result<[Character], KNetworkError>) {
        let response = await Service.executeRequest(endpoint: TemplateEndpoint.wsListCharacters, model: WSListCharacters.self, session: session)
        switch response {
        case .success(let result):
            if let array = result.results {
                return .success(array)
            } else {
                return .failure(KNetworkError.error(message: "Characters not found"))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
