//
//  ContactDetailViewModel.swift
//  GoJekContacts
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class ContactDetailViewModel {
    private let networking = Networking()
    private var contact: Contact?
    private var isEditingMode = false

    public func getContactDetails(contactId: String,
                                  completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.getContacts(contactId: contactId),
                                      type: Contact.self) { [weak self] (response) in
                                        //self?.contact = response
                                        completion?()
        }
    }

    public var count: Int {
        if isEditingMode == true {
            return 0
        }
        return 0
    }

    public func editingMode(boolValue: Bool) {
        isEditingMode = boolValue
    }
}
