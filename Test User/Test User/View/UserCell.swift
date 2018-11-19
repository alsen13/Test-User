//
//  UserCell.swift
//  Test User
//
//  Created by admin on 11/19/18.
//  Copyright © 2018 Alexey Sen. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var imageMedium: UIImageView!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var last: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
