//
//  ContactDetails.swift
//  GoJekContacts
//
//  Created by Ravi Kishore on 8/23/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

struct ContactDetails: Codable {
    let contactId: Int
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    let profilePic: String
    let isFavourite: Bool
    let createdAt: String
    let updatedAt: String

    private enum CodingKeys: String, CodingKey {
        case contactId = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case phoneNumber = "phone_number"
        case profilePic = "profile_pic"
        case isFavourite = "favorite"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
