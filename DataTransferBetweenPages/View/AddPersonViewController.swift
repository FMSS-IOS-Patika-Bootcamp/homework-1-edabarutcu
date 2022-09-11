//
//  AddPersonViewController.swift
//  DataTransferBetweenPages
//
//  Created by detaysoft on 11.09.2022.
//

import UIKit

protocol addNewContact: AnyObject {
    func addPerson(_ controller: AddPersonViewController, with item: Persons)
}

class AddPersonViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    weak var delegate: addNewContact?// In order to use our protocol, we created an object named delegate.
    var newPerson = Persons()// We created a new object from the Persons class.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        newPerson.name = nameTextField.text!
        newPerson.surname = surnameTextField.text!
        newPerson.title = titleTextField.text!
        delegate?.addPerson(self, with: newPerson) // We triggered the function in the delegate and added the new persons we created to the Persons class
    }
}
