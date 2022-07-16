//
//  User.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 11.07.2022.
//

import Foundation
import UIKit

class User {

    var userID: String
    var userAvatar: UIImage?
    var userStatus: String?

    init(userID: String) {
        self.userID = userID
    }

}
