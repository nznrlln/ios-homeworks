//
//  UIView+Extention.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 12.06.2022.
//

import UIKit

extension UIView {
    // свойство самого типа UIView, которое будет подтягивать название файла, где описан UIView или какой либо из его наследников
    static let identifier = String(describing: self)
}

extension UIView {
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
