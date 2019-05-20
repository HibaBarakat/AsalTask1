//
//  UserDetailViewController.swift
//  Task1
//
//  Created by Swift Legends on 16/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var name = ""
    var userName = ""
    var phone = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(name) "
        userNameLabel.text = "User name: \(userName) "
        phoneLabel.text = "Phone: \(phone) "
        emailLabel.text = "email: \(email) "

        // Do any additional setup after loading the view.
    }
}
