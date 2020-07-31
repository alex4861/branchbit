//
//  CameraCell.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class CameraCell: UITableViewCell {

    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    var isCamera: Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        (Photo.image != nil) ^ !isCamera  ? (photoButton.alpha = 0) : (photoButton.alpha = 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func SetPhoto() {
        (Photo.image != nil) ^ !isCamera  ? (photoButton.alpha = 0) : (photoButton.alpha = 1)
    }
    
}
