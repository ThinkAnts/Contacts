//
//  AddContactTableViewCell.swift
//  GoJekContacts
//
//  Created by Ravi on 24/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class AddContactTableViewCell: UITableViewCell {

    public static let reuseIdentifier = "addContactsCell"
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var detailField: UITextField!
    private var contactDetails = ContactDetails()
    private var dic: [String: String] = [:]
    var contactDetail: ((_ contact: String, _ key: String) -> Void)?

    override func awakeFromNib() {
        detailField.addTarget(self, action: #selector(AddContactTableViewCell.textFieldDidEnd(_:)),
                              for: UIControl.Event.editingDidEnd)
    }

    public var contactType: String = "" {
        didSet {
                infoLabel.text = contactType
        }
    }

    @objc func textFieldDidEnd(_ textField: UITextField) {
        if textField.tag == 0 {
             contactDetail?(textField.text ?? "", "first_name")
        }
        if textField.tag == 1 {
            contactDetail?(textField.text ?? "", "last_name")
        }
        if textField.tag == 2 {
            contactDetail?(textField.text ?? "", "phone_number")
        }
        if textField.tag == 3 {
           contactDetail?(textField.text ?? "", "email")
        }
    }
}
