//
//  ContactsTableViewController.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    private let viewModel = ContactsTableViewModel()
    var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Groups",
                                                                style: .plain,
                                                                target: self,
                                                                action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Add"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
//        self.tableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: Bundle.main),
//                                forCellReuseIdentifier: "contactsCell")
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        self.tableView.backgroundView = activityIndicatorView
        getAllContacts()
    }

    func getAllContacts() {
        activityIndicatorView.startAnimating()
        viewModel.getAllContacts(contacts: "contacts") { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicatorView.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }

}

extension ContactsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberRowsCount(index: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.reuseIdentifier,
                                                       for: indexPath)
                                                       as? ContactsTableViewCell else {
                                                                    return UITableViewCell()
                                                        }
        let cellViewModel = viewModel.cellViewModel(index: indexPath.section, row: indexPath.row)
        cell.viewModel = cellViewModel
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitles[section]
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.sectionTitles
    }

    override func tableView(_ tableView: UITableView,
                            sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = viewModel.sectionTitles.firstIndex(of: title) else {
            return -1
        }
        return index
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let contactDetailViewController = storyBoard.instantiateViewController(withIdentifier: "ContactDetail") as?
//                                            ContactDetailViewController ?? ContactDetailViewController()
//        self.navigationController?.pushViewController(contactDetailViewController, animated: true)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? ContactDetailViewController,
            let selectionIndexPath = tableView.indexPathForSelectedRow {
            let detailViewModel = viewModel.cellViewModel(index: selectionIndexPath.section, row: selectionIndexPath.row)
            destionationViewController.detailViewModel = detailViewModel
        }
    }
}
