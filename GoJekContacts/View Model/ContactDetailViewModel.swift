//
//  ContactDetailViewModel.swift
//  GoJekContacts
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 ThinkAnts. All rights reserved.
//

import Foundation

class ContactDetailViewModel {
    private let networking = Networking()
    private var contact: Contact?
    
    init(mode: ContactDetailViewModel) {
        contact = mode.contact
    }
}

