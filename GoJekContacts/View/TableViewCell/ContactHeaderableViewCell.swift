//
//  ContactHeaderTableViewCell.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactHeaderTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var favouriteButton: UIButton!
    @IBOutlet var secondView: UIView!
    @IBOutlet var heightConstarint: NSLayoutConstraint!
    var gradientLayer: CAGradientLayer!
    var updateFavourite: ((_ isFavourite: Bool) -> Void)?

    public var viewModel: ContactDetailTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.firstName + viewModel.lastName
            setFavourite(bool: viewModel.isFavourite)
        }
    }

    func setup(value: Bool) {
        if value == true {
            nameLabel.isHidden = true
            cameraButton.isHidden = false
            secondView.isHidden = true
            heightConstarint.constant = 0.0
        } else {
            nameLabel.isHidden = false
            cameraButton.isHidden = true
            secondView.isHidden = false
            heightConstarint.constant = 78.5
        }
    }

    func setFavourite(bool: Bool) {
        if bool == true {
            favouriteButton.setImage(UIImage(named: "Homefavourite"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage(named: "Favourite"), for: .normal)
        }
    }

    @IBAction func favoutiteClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        setFavourite(bool: sender.isSelected)
        updateFavourite?(sender.isSelected)
    }

}
