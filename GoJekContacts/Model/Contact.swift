//
//  Contact.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

struct Contact: Codable {
    let contactId: Int
    let firstName: String
    let lastName: String
    let profilePic: String
    let isFavourite: Bool
    let urlPath: String

    private enum CodingKeys: String, CodingKey {
        case contactId = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case isFavourite = "favorite"
        case urlPath = "url"
    }

//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        firstName = try container.decode(String.self, forKey: .firstName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        profilePic = try container.decode(String.self, forKey: .profilePic)
//        urlPath = try container.decode(String.self, forKey: .urlPath)
//        contactId = try container.decode(Int.self, forKey: .contactId)
//        isFavourite = try container.decode(Bool.self, forKey: .isFavourite)
//    }
}
