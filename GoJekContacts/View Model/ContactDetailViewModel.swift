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
    private var contactDetails: ContactDetails?
    private var contactDetailsDict = [Int: String]()
    private var isEditingMode = false

    public func getContactDetails(contactId: String,
                                  completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.getContacts(contactId: contactId),
                                      type: ContactDetails.self) { [weak self] (response) in
                                        self?.contactDetails = response[0]
                                        self?.storeInDict()
                                        completion?()
        }
    }

    public var count: Int {
        return contactDetailsDict.count
    }

    public func editingMode(boolValue: Bool) {
        isEditingMode = boolValue
    }

    public func cellValue(row: Int) -> String {
        return contactDetailsDict[row] ?? ""
    }

    private func storeInDict() {
        contactDetailsDict = [0: contactDetails?.firstName ?? "", 1: contactDetails?.lastName ?? "",
                              2: contactDetails?.phoneNumber ?? "", 3: contactDetails?.email ?? ""]
    }
}
