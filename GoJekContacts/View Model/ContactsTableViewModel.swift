//
//  ContactsTableViewModel.swift
//  GoJekContacts
//
//  Created by Ravi on 19/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class ContactsTableViewModel {
    private let networking = Networking()
    private var contacts = [Contact]()
    private var contactSection = [String]()
    private var contactDictionary = [String: [Contact]]()

    public func getAllContacts(contacts: String,
                               completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.allContacts(contacts: contacts),
                                      type: Contacts.self) { [weak self] (response) in
                                        //self?.contacts = response
                                        self?.displayInAlphabeticalOrder()
                                        completion?()
        }
    }

    public var count: Int {
        return contacts.count
    }

    public func numberRowsCount(index: Int) -> Int {
        let key = contactSection[index]
        if let contactValue = contactDictionary[key] {
            return contactValue.count
        }
        return 0
    }

    public func cellViewModel(index: Int, row: Int) -> ContactsTableViewCellModel? {
        let key = contactSection[index]
        let con: [Contact] = contactDictionary[key]!
        let contactTableViewCellModel = ContactsTableViewCellModel(contact: con[row])
        return contactTableViewCellModel
    }

    public var sectionTitles: [String] {
        return contactSection
    }

    private func displayInAlphabeticalOrder() {
        for contact in contacts {
            let firstName: String = contact.firstName
            let key = (Array(firstName)[0]).uppercased()
            if var contactValue = contactDictionary[key] {
                contactValue.append(contact)
                contactDictionary[key] = contactValue
            } else {
                contactDictionary[key] = [contact]
            }
        }
        contactSection = [String](contactDictionary.keys)
        contactSection = contactSection.sorted()
    }
}
