//
//  FeedViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {

    var post = Post(title: "Hot News")
    var post2 = Post(title: "Cold News")

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
//        stackView.backgroundColor = .cyan
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10

        return stackView
    }()

    private let postButton1: UIButton = {
        let button = UIButton()
        button.setTitle("First post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return button
    }()

    private let postButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Second post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap2), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    private func viewInitialSettings() {
        navigationItem.title = "Feed"
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .systemGray6

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        stackView.addArrangedSubview(postButton1)
        stackView.addArrangedSubview(postButton2)
        view.addSubview(stackView)
    }

    private func setupSubviewsLayout() {

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }

    @objc private func handleButtonTap() {
        let postVC = PostViewController()
        postVC.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    @objc private func handleButtonTap2() {
        let postVC = PostViewController()
        postVC.title = post2.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
