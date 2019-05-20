//
//  UsersViewController.swift
//  Task1
//
//  Created by Swift Legends on 15/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadUsersJson()
        print("hippo")
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func downloadUsersJson() {
        guard let downloadURL = URL(string: "http://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            print("Downloaded users")
            guard let data = data else {return}
            // let dataAsString = String(data: data, encoding: .utf8)
            // print(dataAsString)
            do {
                let jsonDecoder = JSONDecoder()
                let usersDownloaded = try jsonDecoder.decode([User].self, from: data)
                
                //print(users)
                self.users = usersDownloaded
                print(self.users[0].email)
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            } catch let jsonErr {
                print("error json serializing: ", jsonErr )
            }
            
            
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "User Cell") as? UsersTableViewCell
        cell?.nameLabel.text = users[indexPath.row].name
        cell?.emailLabel.text = users[indexPath.row].email
       
        return cell ?? UITableViewCell()
        
        
        
    }
    

    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetail") as? UserDetailViewController
        vc?.name = users[indexPath.row].name
        vc?.email = users[indexPath.row].email
        vc?.userName = users[indexPath.row].username
        vc?.phone = users[indexPath.row].phone
        self.navigationController?.pushViewController(vc!, animated: true)
        return indexPath
        
    }

}

