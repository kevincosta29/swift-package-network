//
//  KParser.swift
//  
//
//  Created by Kevin Costa on 15/8/22.
//

import Foundation

struct KParser {
    public static func parserData<T: Decodable>(_ data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public static func parserObject<T: Encodable>(_ object: T) throws -> Data {
        return try JSONEncoder().encode(object)
    }
}
