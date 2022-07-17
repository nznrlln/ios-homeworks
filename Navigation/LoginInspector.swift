//
//  LoginInspector.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 17.07.2022.
//

import Foundation

final class LoginInspector: LoginViewControllerDelegate {

    let checker = Checker.shared
    
    func check(username: String, password: String) -> Bool {

        if username.hash == checker.usernameHash && password.hash == checker.passwordHash {
            return true
        } else {
            return false
        }
    }

}
