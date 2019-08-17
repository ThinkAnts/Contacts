//
//  ContactsTableViewController.swift
//  GoJekContacts
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Contact"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Groups",
                                                                style: .plain,
                                                                target: self,
                                                                action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Add"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
    }
}

extension ContactsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
}
