//
//  GojekContactAPI.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

enum GojekContactAPI {
    case allContacts(contacts: String)
    case getContacts(contactId: String)
}

extension GojekContactAPI: Endpoint {
    var baseURL: URL {
        return URL(string: "http://gojek-contacts-app.herokuapp.com")!
    }

    var path: String {
        switch self {
        case .allContacts(let contacts):
            return "/\(contacts).json"
        case .getContacts(let contactId):
            return "/contacts/\(contactId).json"
        }
    }
}
