//
//  PostViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postFromFeed = FeedViewController()
    private lazy var barButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "info.circle")
        barButton.target = self
        barButton.action = #selector(handleButtonTap)

        return barButton
    }()


    private func viewInitialSettings() {
        self.view.backgroundColor = .systemBackground

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        navigationItem.rightBarButtonItems = [barButton]
    }

    private func setupSubviewsLayout() {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()

        // ниже проверка интернет ресурсов
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
//        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: nil)
//
//        navigationItem.rightBarButtonItems = [add, play]
    }

    @objc private func handleButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true, completion: nil)
    }

}
