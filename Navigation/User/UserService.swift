//
//  UserService.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 11.07.2022.
//

import Foundation

protocol UserService {
    func checkUser(userID: String) -> User?
}
