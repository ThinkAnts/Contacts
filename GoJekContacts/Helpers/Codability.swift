//
//  Codability.swift
//  GoJekContacts
//
//  Created by Ravi on 24/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

protocol Codability: Codable {}
extension Codability {
    typealias Kind = Self
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
//
//    static func decode(data: Data) -> Kind? {
//        return try? JSONDecoder().decode(Kind.self, from: data)
//    }
}
