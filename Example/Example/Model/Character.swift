//
//  Character.swift
//  Example
//
//  Created by Kevin Costa on 12/8/22.
//

import Foundation

struct Character: Decodable, Identifiable {
    
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let created: String?
    
}
