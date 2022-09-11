//
//  Persons.swift
//  DataTransferBetweenPages
//
//  Created by detaysoft on 11.09.2022.
//

import Foundation

class Persons {
    var name: String
    var surname: String
    var title: String
    
    init() {
        self.name = ""
        self.surname = ""
        self.title = ""
    }
    
    func fullName() -> String {
        return name + " " + surname
    }
}
