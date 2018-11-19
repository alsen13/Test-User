//
//  User.swift
//  Test User
//
//  Created by admin on 11/17/18.
//  Copyright © 2018 Alexey Sen. All rights reserved.
//

import Foundation
import UIKit

final class GetUsers: Codable {
    var results: [User]
    
}

class User: Codable {
    let name: Name
    let email: String
    let location: Location
    let phone: String
    let picture: Picture
   
}

class Name: Codable {
    let first: String
    let last: String
    
}

class Location: Codable {
    let street: String
    let city: String
    let state: String
   
}

class Picture: Codable {
    let medium: String
    let large: String
  
}


