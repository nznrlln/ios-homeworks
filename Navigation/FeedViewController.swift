//
//  FeedViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let postButton = UIButton()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var post = Post(postTitle: "Hot News")  // не совсем понятно где именно надо созавать структуру? Просто внутри любого файла .swift или именно внутри класса? Если просто внутри файла - то значние очень просто передается, если внутри класса - сначала создаем ссылку на класс, потом подтягиваем

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .darkGray

        self.postButton.setTitle("Press to see the post", for: .normal)
        self.view.addSubview(postButton)
        self.postButton.frame = CGRect(x: screenWidth/2 - 100, y: screenHeight/2 - 20, width: 200, height: 20)
        self.postButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Feed", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Feed", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Feed", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Feed", #function)
    }

    deinit {
        print("Feed", #function, #file)
    }


    @objc
    func handleButtonTap(){
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
