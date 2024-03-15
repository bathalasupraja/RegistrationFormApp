//
//  RegistrationTableViewCell.swift
//  RegistrationFormApp
//
//  Created by Supraja on 14/03/24.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {
    
    static let id = "RegistrationTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
        nameTextField.tag = 100
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
extension RegistrationTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 100 {
            print("\n>>>> name text field")
            nameTextField.becomeFirstResponder()
        } else {
            
        }
        return true
    }
}
