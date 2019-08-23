//
//  ContactDetailViewController.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    @IBOutlet var detailsTableView: UITableView!
    private var detailModel = ContactDetailViewModel()
    private var isEditingMode = false
    private var contactId = ""
    var contactArray = ["First Name", "Last Name", "mobile", "email"]

    public var selectedContactId: Int = 0 {
        didSet {
               contactId = String(selectedContactId)
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getSelectedContactDetails()
    }

    func setup() {
        navigationBarItemSetup(title: "Edit", action: #selector(editButtonTapped))
        detailsTableView.register(UINib.init(nibName: "ContactHeaderTableViewCell", bundle: Bundle.main),
                                  forCellReuseIdentifier: "contactHeader")
        detailsTableView.register(UINib.init(nibName: "ContactDetailTableViewCell", bundle: Bundle.main),
                                  forCellReuseIdentifier: "contactDetail")

        detailsTableView.tableFooterView = UIView()
    }

    func navigationBarItemSetup(title: String, action: Selector) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title,
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: action)
    }

    func editingMode(value: Bool) {
        if value == true {
            navigationBarItemSetup(title: "Edit", action: #selector(editButtonTapped))
            self.navigationItem.leftBarButtonItem = nil
            isEditingMode = false
            detailModel.editingMode(boolValue: false)
        } else {
            navigationBarItemSetup(title: "Done", action: #selector(editButtonTapped(sender:)))
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                    style: .plain,
                                                                    target: self,
                                                                    action: #selector(cancelButtonTapped))
            isEditingMode = true
            detailModel.editingMode(boolValue: true)
        }
        detailsTableView.reloadData()
    }

    @objc func editButtonTapped(sender: UIBarButtonItem) {
        editingMode(value: isEditingMode)
    }

    @objc func cancelButtonTapped(sender: UIBarButtonItem) {
        editingMode(value: isEditingMode)
    }

    // API Call
    func getSelectedContactDetails() {
        detailModel.getContactDetails(contactId: contactId) { [weak self] in
            DispatchQueue.main.async {
                self?.detailsTableView.reloadData()
            }
        }
    }
}

extension ContactDetailViewController: UITableViewDataSource, UITableViewDelegate {

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailModel.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if isEditingMode == true {
            return 205.0
        }
        return 280.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isEditingMode == false {
            if indexPath.row == 0 || indexPath.row == 1 {
                return 0
            }
        }
        return 56.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "contactHeader") as?
                                    ContactHeaderTableViewCell ?? ContactHeaderTableViewCell()
        headerCell.setup(value: isEditingMode)
        return headerCell
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail") as?
            ContactDetailTableViewCell ?? ContactDetailTableViewCell()
        if isEditingMode == false {
            if indexPath.row == 0 || indexPath.row == 1 {
                cell.isHidden = true
            }
        }
        cell.value = detailModel.cellValue(row: indexPath.row)
        return cell
    }
}
