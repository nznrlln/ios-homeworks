//
//  InfoViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close info", for: .normal)
        closeButton.frame = CGRect.zero
        closeButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return closeButton
    }()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    private func viewInitialSettings() {
        self.view.backgroundColor = .blue

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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    @objc
    func handleButtonTap() {
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

        self.present(alert, animated: true, completion: nil)
    }

}
