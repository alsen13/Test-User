//
//  DetailViewController.swift
//  Test User
//
//  Created by admin on 11/19/18.
//  Copyright © 2018 Alexey Sen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var largeImage: UIImageView!
    
    var detailUser: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstName.text = detailUser?.name.first
        lastName.text = detailUser?.name.last
        email.text = detailUser?.email
        phone.text = detailUser?.phone
        state.text = detailUser?.location.state
        city.text = detailUser?.location.city
        street.text = detailUser?.location.street
        
        if let imageURL = URL(string: (detailUser?.picture.large)!) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data  = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.largeImage.image = image
                    }
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
