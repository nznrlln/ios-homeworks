//
//  InfoViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private let closeButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitle("Close info", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
           viewInitialSettings()
       }

    private func viewInitialSettings() {
        self.view.backgroundColor = .systemGray4

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        self.view.addSubview(closeButton)
    }

    private func setupSubviewsLayout() {
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }



    @objc private func handleButtonTap() {
        let alert = UIAlertController(title: "Close info", message: "Do you want to close the info page?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel Action")
        }
        let closeAction = UIAlertAction(title: "Close", style: .destructive) { _ in
            print("Close Action")
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(closeAction)

        present(alert, animated: true, completion: nil)
    }

}
