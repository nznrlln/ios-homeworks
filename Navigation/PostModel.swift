//
//  PostModel.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 11.06.2022.
//

import Foundation
import UIKit

struct PostModel {
    var author: String
    var description: String?
    var imageName: String
    var likes: Int
    var views: Int

    static func makeModel() -> [PostModel] {
        var models = [PostModel]()

        models.append(PostModel(author: "CatNews", description: "Good morning, everyone. Lets start our day with some news!", imageName: "cat daily news", likes: 1, views: 100))
        models.append(PostModel(author: "CatNews", description: "The weather is bad, it's pouring outside. If you don't have any urgent matters - better stay home", imageName: "cat weather news", likes: 10, views: 100))
        models.append(PostModel(author: "CatNews", description: "Yesterday our local footbal team won the match againts the plushies team. Congratulations!", imageName: "cat sport news", likes: 100, views: 100))
        models.append(PostModel(author: "CatNews", description: "Finally, it happend! Birth of a hero!", imageName: "cat laser news", likes: 999, views: 999))

        return models
    }
}
