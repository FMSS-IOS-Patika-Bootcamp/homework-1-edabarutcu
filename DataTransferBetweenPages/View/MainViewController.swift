//
//  ViewController.swift
//  DataTransferBetweenPages
//
//  Created by detaysoft on 8.09.2022.
//

import UIKit

class MainViewController: UIViewController, addNewContact {
    
    @IBOutlet weak var tableView: UITableView!
    var allContacts = [Persons]() // We collect each created user in this array.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPersonVC" {
            let destinationVC = segue.destination as? AddPersonViewController
            destinationVC?.delegate = self// We trigger the delegate when our add person screen opens.
        }
    }
    
    func addPerson(_ controller: AddPersonViewController, with item: Persons) {
        let newCell = allContacts.count
        allContacts.append(item)
        let indexPath = IndexPath(row: newCell, section: 0)  // It triggers the function here.
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ekleButonunaBasildi(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addPersonVC", sender: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactsTableViewCell {
            let contact = allContacts[indexPath.row]
            cell.prepareForContacts(for: contact)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
