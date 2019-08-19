//
//  Endpoint.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
}
