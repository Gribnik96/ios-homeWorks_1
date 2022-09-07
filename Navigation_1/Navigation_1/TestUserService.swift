import Foundation
import UIKit

class TestUserService: UserService {
    
 private let user: User
    
    init(user: User) {
        self.user = user
    }
    func getUserBy(_ login: String, _ password: String) -> User? {
        guard
            login == user.login,
            password == user.password
                else { return nil }
        return user
    }
}


