//
//  User.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 31.08.2022.
//

import Foundation
import UIKit

protocol UserService {
    func getUserBy(_ login: String,_ password: String) -> User?
}

class User {
    
    var login: String
    var userName: String
    var avatar: UIImage?
    var status: String
    let password: String
    
    init(login: String, userName: String, avatar: UIImage?, status: String, password: String) {
        self.login = login
        self.userName = userName
        self.avatar = avatar
        self.status = status
        self.password = password
    }
}
