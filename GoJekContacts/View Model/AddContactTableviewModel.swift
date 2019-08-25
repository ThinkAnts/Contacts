//
//  AddContactTableviewModel.swift
//  GoJekContacts
//
//  Created by Ravi on 24/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class AddContactTableviewModel {
    private let networking = Networking()
    private var contactDetails =  ContactDetails()
    private var jsonData: Data?
    private var codable: Codability?
    private var canBeAdded = false
    private var contactDetailArray = ["First Name", "Last name", "mobile", "email"]
    private var contactDetailsDict = [[String: String]]()

    public func addContact(contacts: String,
                           completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.allContacts(contacts: contacts),
                                      type: ContactDetails.self,
                                      method: "POST", params: jsonData) { [weak self] (response) in
                                        self?.contactDetails = response[0]
                                        completion?()
        }
    }

    public var count: Int {
        return contactDetailArray.count
    }

    public func cellValue(row: Int) -> String {
        return contactDetailArray[row]
    }

    public func cellViewModel() -> ContactDetailTableViewCellModel? {
        let contactDetailTableViewCellModel = ContactDetailTableViewCellModel(contactDetails:
            self.contactDetails)
        return contactDetailTableViewCellModel
    }

    public func addContact(contact: String, keyName: String) {
        contactDetailsDict.append([keyName: contact])
        if keyName == "first_name" {
            contactDetails.firstName = contact
        }
        if keyName == "last_name" {
            contactDetails.lastName = contact
        }
        if keyName == "email" {
            contactDetails.email = contact
        }
        if keyName == "phone_number" {
            contactDetails.phoneNumber = contact
        }
        if contactDetailsDict.count == 4 {
            codable = contactDetails
            jsonData = codable?.encode()
            canBeAdded = true
        }
    }

    public var isSubmited: Bool {
        return canBeAdded
    }
}
