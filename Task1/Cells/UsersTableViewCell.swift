//
//  UsersTableViewCell.swift
//  Task1
//
//  Created by Swift Legends on 15/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
