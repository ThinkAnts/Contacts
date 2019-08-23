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
     @IBOutlet var detailLabel: UITextField!
    public var value: String = "" {
        didSet {
            detailLabel.text = value
        }
    }
}
