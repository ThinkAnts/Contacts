//
//  ContactDetailTableViewCellModel.swift
//  GoJekContacts
//
//  Created by Ravi Kishore on 8/23/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class ContactDetailTableViewCellModel {

    private let contactDetail: ContactDetails

    init(contactDetails: ContactDetails) {
        self.contactDetail = contactDetails
    }

    var firstName: String {
        return contactDetail.firstName ?? ""
    }

    var lastName: String {
        return contactDetail.lastName ?? ""
    }

    var contactId: Int {
        return contactDetail.contactId ?? 0
    }

    var profilePic: String {
        return contactDetail.profilePic ?? ""
    }

    var isFavourite: Bool {
        return contactDetail.isFavourite ?? false
    }

    var email: String {
        return contactDetail.email ?? ""
    }

    var phoneNumber: String {
        return contactDetail.phoneNumber ?? ""
    }

    var updatedAt: String {
        return contactDetail.updatedAt ?? ""
    }

    var createdAt: String {
        return contactDetail.createdAt ?? ""
    }
}
