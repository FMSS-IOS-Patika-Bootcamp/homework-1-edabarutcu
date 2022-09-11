//
//  ContactsTableViewCell.swift
//  DataTransferBetweenPages
//
//  Created by detaysoft on 11.09.2022.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    func prepareForContacts(for object: Persons) {
        fullNameLabel.text = object.fullName()
        titleLabel.text = object.title
    }
}
