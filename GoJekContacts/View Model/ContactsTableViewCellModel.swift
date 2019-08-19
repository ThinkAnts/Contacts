//
//  ContactsTableViewCellModel.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class ContactsTableViewCellModel {

    private let contact: Contact

    init(contact: Contact) {
        self.contact = contact
    }

    var firstName: String {
        return contact.firstName
    }

    var lastName: String {
        return contact.lastName
    }

    var contactId: Int {
        return contact.contactId
    }

    var profilePic: String {
        return contact.profilePic
    }

    var isFavourite: Bool {
        return contact.isFavourite
    }
}
