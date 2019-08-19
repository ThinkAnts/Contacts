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
//    let collation = UILocalizedIndexedCollation.current()
//    var sections: [[AnyObject]] = []
//    var objects: [AnyObject] = [] {
//        didSet {
//            let selector = #selector(getter: UIApplicationShortcutItem.localizedTitle)
//            sections = Array(repeating: [], count: collation.sectionTitles.count)
//
//            let sortedObjects = collation.sortedArray(from: objects, collationStringSelector: selector)
//            for object in sortedObjects {
//                let sectionNumber = collation.section(for: object, collationStringSelector: selector)
//                sections[sectionNumber].append(object as AnyObject)
//            }
//
//            //self.tableView.reloadData()
//        }
//    }

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
        self.tableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: Bundle.main),
                                forCellReuseIdentifier: "contactsCell")
        getAllContacts()
    }

    func getAllContacts() {
        viewModel.getAllContacts(contacts: "contacts") { [weak self] in
            DispatchQueue.main.async {
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
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
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
        guard let index = viewModel.contactSection.firstIndex(of: title) else {
            return -1
        }
        return index
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contactDetailViewController = storyBoard.instantiateViewController(withIdentifier: "ContactDetail") as?
                                            ContactDetailViewController ?? ContactDetailViewController()
        self.navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
}
