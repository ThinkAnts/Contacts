//
//  Response.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
public func decode<T: Codable>(_ type: T.Type) -> [T]? {
    do {
            let jsonDecoder = JSONDecoder()
            do {
                let response = try jsonDecoder.decode([T].self, from: data)
                return response
            } catch _ {
                let response = try jsonDecoder.decode(T.self, from: data)
                return [response]
            }
        } catch {
            print(error)
      }
       return nil
    }
}
