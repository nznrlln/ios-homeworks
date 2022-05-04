//
//  PostViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postFromFeed = FeedViewController()
    let barButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground

        self.title = postFromFeed.post.postTitle
        // не совсем понятно где именно надо созавать структуру? Просто внутри любого файла .swift или именно внутри класса? Если просто внутри файла - то значние очень просто передается, если внутри класса - сначала создаем ссылку на класс, потом подтягиваем

        self.barButton.image = UIImage(systemName: "info.circle")
        navigationItem.rightBarButtonItems = [barButton]
        self.barButton.target = self
        self.barButton.action = #selector(handleButtonTap)

        // ниже проверка интернет ресурсов
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
//        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: nil)
//
//        navigationItem.rightBarButtonItems = [add, play]
    }

    @objc
    func handleButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true, completion: nil)
    }

}
