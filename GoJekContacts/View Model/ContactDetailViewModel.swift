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
    private var contactDetailsDict = [[String: String]]()
    private var isEditingMode = false
    private var jsonData: Data?
    private var codable: Codability?
    public func getContactDetails(contactId: String,
                                  completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.getContacts(contactId: contactId),
                                      type: ContactDetails.self, method: "GET", params: nil) { [weak self] (response) in
                                        self?.contactDetails = response[0]
                                        self?.storeInDict()
                                        completion?()
        }
    }

    public func updateContactDetails(contactId: String,
                                     completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GojekContactAPI.updateContact(contactId: contactId),
                                      type: ContactDetails.self, method: "PUT",
                                      params: jsonData) { [weak self] (response) in
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

    public func cellValue(row: Int) -> [String: String] {
        let dic = contactDetailsDict[row]
        return dic
    }

    private func storeInDict() {
        contactDetailsDict = [["First Name": contactDetails?.firstName ?? ""],
                              ["Last name": contactDetails?.lastName ?? ""],
                              ["mobile": contactDetails?.phoneNumber ?? ""],
                              ["email": contactDetails?.email ?? ""]]
    }

    public func cellViewModel() -> ContactDetailTableViewCellModel? {
        let contactDetailTableViewCellModel = ContactDetailTableViewCellModel(contactDetails:
                                                                            self.contactDetails ?? ContactDetails())
        return contactDetailTableViewCellModel
    }

    public func updateContact(details: ContactDetails) {
        contactDetails = details
        codable = contactDetails
        jsonData = codable?.encode()
    }

    public func updateFavourite(favourite: Bool) {
        contactDetails?.isFavourite = favourite
        codable = contactDetails
        jsonData = codable?.encode()
        let contactId: String? = String(contactDetails?.contactId ?? 0)
        if let contactIdValue = contactId {
            updateContactDetails(contactId: contactIdValue, completion: nil)
        }
    }
}
