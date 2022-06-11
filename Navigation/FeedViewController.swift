//
//  FeedViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private let postButton1: UIButton = {
        let button = UIButton()
        button.setTitle("First post", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return button
    }()

    private let postButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Second post", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap2), for: .touchUpInside)

        return button
    }()

    var post = Post(title: "Hot News")
    var post2 = Post(title: "Cold News")

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10

        return stackView
    }()

    private func viewInitialSettings() {
        self.title = "Feed"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .darkGray

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        stackView.addArrangedSubview(postButton1)
        stackView.addArrangedSubview(postButton2)
        self.view.addSubview(stackView)
    }

    private func setupSubviewsLayout() {

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    @objc private func handleButtonTap(){
        let postVC = PostViewController()
        postVC.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    @objc private func handleButtonTap2(){
        let postVC = PostViewController()
        postVC.title = post2.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
