//
//  ViewController.swift
//  RegistrationFormApp
//
//  Created by Supraja on 14/03/24.
//

import UIKit


struct FieldModel {
    var name: String
    var placeholder: String
    var value: String?
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var registrationTableView: UITableView!
    
    var fields = [FieldModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFields()
        registrationTableView.separatorStyle = .none
        registrationTableView.allowsSelection = false
        registrationTableView.dataSource = self
        registrationTableView.delegate = self
    }
    
    func createFields() {
        fields.append(FieldModel(name: "Name", placeholder: "Enter name"))
        fields.append(FieldModel(name: "Email", placeholder: "Enter email"))
        fields.append(FieldModel(name: "Phone", placeholder: "Enter phone number"))
        fields.append(FieldModel(name: "Dob", placeholder: "Enter date of birth"))
        fields.append(FieldModel(name: "Gender", placeholder: "Enter gender"))
    }
    
    func getCellIdentifierAtIndexPath(_ indexPath: IndexPath) -> String {
        switch indexPath.row {
        case 5:
            return RegisterActionTableViewCell.id
        default:
            return RegistrationTableViewCell.id
        }
    }
    
    func getCellHeightAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 5:
            return 100
        default:
            return 70
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = getCellIdentifierAtIndexPath(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let registrationTableViewCell = cell as? RegistrationTableViewCell {
            let field = fields[indexPath.row]
            registrationTableViewCell.prepareWithField(field, delegate: self, indexPath: indexPath)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = getCellHeightAtIndexPath(indexPath)
        return height
    }
}

extension ViewController: RegistrationTableViewCellDelegate {
    func didUpdateText(_ text: String?, tag: Int) {
        print(text)
        print(tag)
        fields[tag].value = text
    }
}
                
