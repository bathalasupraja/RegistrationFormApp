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
    
}
class ViewController: UIViewController {
    
    @IBOutlet weak var registrationTableView: UITableView!
    
    var fields = [FieldModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFields()
        registrationTableView.dataSource = self
        registrationTableView.delegate = self
    }
    
    func createFields() {
        fields.append(FieldModel(name: "Name", placeholder: " "))
        fields.append(FieldModel(name: "Email", placeholder: " "))
        fields.append(FieldModel(name: "Phone", placeholder: " "))
        fields.append(FieldModel(name: "Dob", placeholder: " "))
        fields.append(FieldModel(name: "Gender", placeholder: " "))
    }
    
    func getCellIdentifierAtIndexPath(_ indexPath: IndexPath) -> String {
        switch indexPath.row {
        case 0:
            return "RegistrationTableViewCell"
        case 6:
            return "RegisterActionTableViewCell"
        default:
            return ""
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RegistrationTableViewCell.id, for: indexPath)
        if let registrationTableViewCell = cell as? RegistrationTableViewCell {
            registrationTableViewCell.nameLabel.text = field.name
                registrationTableViewCell.nameTextField.text = field.placeholder
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
                
