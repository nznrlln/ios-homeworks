//
//  FeedViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let postButton1: UIButton = {
        let button = UIButton()
        button.setTitle("First post", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return button
    }()

    let postButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Second post", for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap2), for: .touchUpInside)

        return button
    }()

    var post = Post(title: "Hot News")
    var post2 = Post(title: "Cold News")

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.frame = CGRect.zero
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical // вертикальное расположение элементов
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

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
//            stackView.widthAnchor.constraint(equalToConstant: 200),
//            stackView.heightAnchor.constraint(equalToConstant: 100)
            // кнопки сами зададут размер stackView
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    @objc
    func handleButtonTap(){
        let postVC = PostViewController()
        postVC.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    @objc
    func handleButtonTap2(){
        let postVC = PostViewController()
        postVC.title = post2.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
