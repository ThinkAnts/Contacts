//
//  ContactsTableViewController.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    let collation = UILocalizedIndexedCollation.current()
    var sections: [[AnyObject]] = []
    var objects: [AnyObject] = [] {
        didSet {
            let selector = #selector(getter: UIApplicationShortcutItem.localizedTitle)
            sections = Array(repeating: [], count: collation.sectionTitles.count)

            let sortedObjects = collation.sortedArray(from: objects, collationStringSelector: selector)
            for object in sortedObjects {
                let sectionNumber = collation.section(for: object, collationStringSelector: selector)
                sections[sectionNumber].append(object as AnyObject)
            }

            self.tableView.reloadData()
        }
    }

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
    }

}

extension ContactsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return collation.sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return collation.sectionTitles[section]
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return collation.sectionIndexTitles
    }

    override func tableView(_ tableView: UITableView,
                            sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return collation.section(forSectionIndexTitle: index)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contactDetailViewController = storyBoard.instantiateViewController(withIdentifier: "ContactDetail") as?
                                            ContactDetailViewController ?? ContactDetailViewController()
        self.navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
}
