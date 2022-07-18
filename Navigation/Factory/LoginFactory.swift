//
//  LoginFactory.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 17.07.2022.
//

import Foundation

protocol LoginFactory {
    func create() -> LoginInspector
}

final class MyLoginFactory: LoginFactory {

    func create() -> LoginInspector {
        return LoginInspector()
    }

}
