//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 11.07.2022.
//

import Foundation

class CurrentUserService: UserService {

    var currentUser = User(userID: "Sleeping Cat")

    func checkUser(userID: String) -> User? {
        if userID == currentUser.userID {
            debugPrint("Auth seccusess")
            return currentUser
        } else {
            return nil
        }
    }
}
