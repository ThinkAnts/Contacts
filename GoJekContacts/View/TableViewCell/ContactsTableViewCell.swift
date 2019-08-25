//
//  ContactsTableViewCell.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    public static let reuseIdentifier = "contactsCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var favouriteImageView: UIImageView!

    public var viewModel: ContactsTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.firstName + viewModel.lastName
            if viewModel.isFavourite == true {
                favouriteImageView.image = UIImage(named: "Homefavourite")
            } else {
                favouriteImageView.image = UIImage(named: "Favourite")
            }
        }
    }
}
