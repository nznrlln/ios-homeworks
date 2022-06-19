//
//  PhotoCollection.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 16.06.2022.
//

import Foundation
import UIKit

struct PhotoModel {

    var photoImage: UIImage

    static func makeCollection() -> [PhotoModel] {
        var collection = [PhotoModel]()
        for number in 1...20 {
            collection.append(PhotoModel(photoImage: UIImage(named: String(number)) ?? UIImage()))
        }
        return collection
    }
}
