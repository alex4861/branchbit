//
//  DatePicker.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class DatePicker: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.maxLength = 2
        // Initialization code
    }
    @IBOutlet weak var textField: CustomTextField!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
