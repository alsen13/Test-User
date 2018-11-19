//
//  ViewController.swift
//  Test User
//
//  Created by admin on 11/17/18.
//  Copyright © 2018 Alexey Sen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var users = [User]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let downloadUsers = try JSONDecoder().decode(GetUsers.self, from: data)
                self.users = downloadUsers.results
                print(downloadUsers.results[0].name.first)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
                
                
            } catch let error {
                print(error)
            }
            
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailUserInfo" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DetailViewController
                dvc.detailUser = self.users[indexPath.row]
                }
            }
        }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell
        let allUsers = users[indexPath.row]
        
        cell.first.text = allUsers.name.first
        cell.last.text = allUsers.name.last
        
        if let imageURL = URL(string: allUsers.picture.medium) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data  = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageMedium.image = image
                    }
                }
            }
        }
        
        
        cell.imageMedium.image = UIImage(named: allUsers.picture.medium)
        
        return cell
    }
    
    
}
