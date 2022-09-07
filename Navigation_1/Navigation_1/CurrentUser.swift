//
//  CurrentUser.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 31.08.2022.
//

import Foundation

class CurrentUserService: UserService  {
    func getUserBy(_ login: String,_ password: String) -> User? {
        guard
            login == user.login,
            password == user.password
                else { return nil }
        return user
    }
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
}
    
