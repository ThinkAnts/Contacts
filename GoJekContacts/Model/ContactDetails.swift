//
//  ContactDetails.swift
//  GoJekContacts
//
//  Created by Ravi Kishore on 8/23/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

struct ContactDetails: Codability {
    var contactId: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phoneNumber: String?
    var profilePic: String?
    var isFavourite: Bool?
    var createdAt: String?
    var updatedAt: String?

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

    init() {
        self.contactId = 0
        self.firstName = ""
        self.lastName = ""
        self.createdAt = ""
        self.email = ""
        self.phoneNumber = ""
        self.isFavourite = false
        self.updatedAt = ""
        self.profilePic = ""
    }
}
