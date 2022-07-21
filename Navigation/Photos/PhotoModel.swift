//
//  PhotoCollection.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 16.06.2022.
//

import Foundation
import UIKit

class PhotoModel {

    static func makeCollection() -> [UIImage] {
        var collection = [UIImage]()
        for number in 1...20 {
            collection.append(UIImage(named: String(number)) ?? UIImage())
        }
        return collection
    }
}
