//
//  RegistrationTableViewCell.swift
//  RegistrationFormApp
//
//  Created by Supraja on 14/03/24.
//

import UIKit

protocol RegistrationTableViewCellDelegate: AnyObject {
    func didUpdateText(_ text: String?, tag: Int)
}
    

class RegistrationTableViewCell: UITableViewCell {
    
    static let id = "RegistrationTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var genderData = ["Male", "Female", "Other"]
    
    weak var delegate: RegistrationTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func prepareWithField(_ field: FieldModel, delegate: RegistrationTableViewCellDelegate?, indexPath: IndexPath) {
        nameTextField.inputView = getInputViewAtIndexPath(indexPath)
        nameTextField.keyboardType = getKeypadTypeForIndexPath(indexPath)
        nameLabel.text = field.name
        nameTextField.placeholder = field.placeholder
        nameTextField.text = field.value
        self.delegate = delegate
        nameTextField.tag = indexPath.row
    }
    
    func getKeypadTypeForIndexPath(_ indexPath: IndexPath) -> UIKeyboardType {
        switch indexPath.row {
        case 1:
            return .emailAddress
        case 2:
            return .numberPad
        default:
            return .default
        }
    }
    
    func getInputViewAtIndexPath(_ indexPath: IndexPath) -> UIView? {
        switch indexPath.row {
        case 3:
            let datePicker = UIDatePicker()
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.addTarget(self, action: #selector(didChangeDate), for: .valueChanged)
            datePicker.datePickerMode = .date
            return datePicker
        case 4:
            let picker = UIPickerView()
            picker.delegate = self
            picker.dataSource = self
            return picker
        default:
            return nil
        }
    }
    
    @objc func didChangeDate(_ sender: UIDatePicker) {
        print(sender.date)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        nameTextField.text = formatter.string(from: sender.date)
    }
}
extension RegistrationTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didUpdateText(textField.text, tag: textField.tag)
    }
}

extension RegistrationTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let gender = genderData[row]
        return gender
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let gender = genderData[row]
        nameTextField.text = gender
        nameTextField.resignFirstResponder()
    }
}
