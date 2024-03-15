//
//  RegisterActionTableViewCell.swift
//  RegistrationFormApp
//
//  Created by Supraja on 15/03/24.
//

import UIKit


class RegisterActionTableViewCell: UITableViewCell {
    
    static let id = "RegisterActionTableViewCell"
    
    @IBOutlet weak var registerButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.layer.cornerRadius = 6
        contentView.backgroundColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
