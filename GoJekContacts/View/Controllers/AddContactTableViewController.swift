//
//  AddContactTableViewController.swift
//  GoJekContacts
//
//  Created by Ravi on 24/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class AddContactTableViewController: UITableViewController {

    private var addContactModel = AddContactTableviewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(doneButtonTapped))
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "ContactHeaderTableViewCell", bundle: Bundle.main),
                                  forCellReuseIdentifier: "contactHeader")
    }

    @objc func doneButtonTapped(sender: UIBarButtonItem) {
        if addContactModel.isSubmited {
            addContact()
        } else {
            print("All fields are mandatroty")
        }
    }

    @objc func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    func addContact() {
        addContactModel.addContact(contacts: "contacts") { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.navigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
extension AddContactTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addContactModel.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 205.0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "contactHeader") as?
            ContactHeaderTableViewCell ?? ContactHeaderTableViewCell()
        headerCell.setup(value: true)
        return headerCell
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddContactTableViewCell.reuseIdentifier,
                                                       for: indexPath)
            as? AddContactTableViewCell else {
                return UITableViewCell()
        }
        cell.contactType = addContactModel.cellValue(row: indexPath.row)
        cell.detailField.tag = indexPath.row
        cell.contactDetail = { [weak self] (contact, key) in
            self?.addContactModel.addContact(contact: contact, keyName: key)
        }
        return cell
    }
}
