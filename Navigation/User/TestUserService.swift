//
//  TestUserService.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 12.07.2022.
//

import Foundation

class TestUserService: UserService {

    var currentUser = User(userID: "Barking Dog")

    func checkUser(userID: String) -> User? {
        if userID == currentUser.userID {
            debugPrint("Auth seccusess")
            return currentUser
        } else {
            return nil
        }
    }
}
