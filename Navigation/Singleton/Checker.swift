//
//  Checker.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 17.07.2022.
//

import Foundation

final class Checker {

    private let username: String = "Sleeping Cat"
    private let password: String = "123456"

    lazy var usernameHash = username.hash
    lazy var passwordHash = password.hash

    static let shared = Checker()
    private init() {}

//    func checkUser(username: String, password: String) -> Bool {
//        let usernameHash = username.hash
//        let passwordHash = password.hash
//        if usernameHash == self.username && passwordHash == self.password {
//            return true
//        } else {
//            return false
//        }
//    }

}
