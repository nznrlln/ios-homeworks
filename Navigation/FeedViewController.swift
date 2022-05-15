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

    var post = Post(title: "Hot News")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Feed"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .darkGray

        self.postButton.setTitle("Press to see the post", for: .normal)
        self.view.addSubview(postButton)
        self.postButton.frame = CGRect(x: screenWidth/2 - 100, y: screenHeight/2 - 20, width: 200, height: 20)
        self.postButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

    }

    @objc
    func handleButtonTap(){
        let postVC = PostViewController()
        postVC.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
