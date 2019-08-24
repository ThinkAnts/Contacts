//
//  ContactDetailTableViewCell.swift
//  GoJekContacts
//
//  Created by Ravi on 18/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {
     @IBOutlet var infoLabel: UILabel!
     @IBOutlet var detailField: UITextField!
    private var contactDetail = ContactDetails()
    var updatedContact: ((_ contactDetail: ContactDetails) -> Void)?
    public var contactDic: [String: String] = [:] {
        didSet {
            for (key, value) in contactDic {
                infoLabel.text = key
                detailField.text = value
            }
        }
    }

    public var viewModel: ContactDetailTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
              contactDetail.firstName = viewModel.firstName
              contactDetail.lastName = viewModel.lastName
              contactDetail.email = viewModel.email
              contactDetail.phoneNumber = viewModel.phoneNumber
              contactDetail.contactId = viewModel.contactId
              contactDetail.profilePic = viewModel.profilePic
              contactDetail.updatedAt = viewModel.updatedAt
              contactDetail.createdAt = viewModel.createdAt
        }
    }

    override func awakeFromNib() {
        detailField.addTarget(self, action: #selector(ContactDetailTableViewCell.textFieldDidChange(_:)),
                                                        for: UIControl.Event.editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.tag == 0 {
            contactDetail.firstName = textField.text
        }
        if textField.tag == 1 {
            contactDetail.lastName = textField.text
        }
        if textField.tag == 2 {
            contactDetail.phoneNumber = textField.text
        }
        if textField.tag == 3 {
            contactDetail.email = textField.text
        }

       updatedContact?(contactDetail)
    }
}
