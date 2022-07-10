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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()

    }
    
    private func viewInitialSettings() {
        view.backgroundColor = .systemGray6

        setupSubviews()
    }

    private func setupSubviews() {
        self.navigationItem.rightBarButtonItems = [barButton]
    }

    @objc private func handleButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true, completion: nil)
    }

}
