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

    public var viewModel: ContactDetailTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.firstName + viewModel.lastName
            if viewModel.isFavourite == true {
                favouriteButton.setImage(UIImage(named: "Homefavourite"), for: .normal)
                favouriteButton.imageView?.contentMode = .scaleAspectFill
            }
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

//    func createGradientLayer() {
//        gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.contentView.frame
//        let color = UIColor(hex: "FFFFFF")
//        let color1 = UIColor(hex: "50E3C2")
//        gradientLayer.colors = [color?.cgColor, color1?.cgColor]
//        self.contentView.layer.insertSublayer(gradientLayer, at: 0)
//    }
}
