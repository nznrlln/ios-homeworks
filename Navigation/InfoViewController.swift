//
//  InfoViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let closeButton = UIButton()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue

        self.closeButton.setTitle("Close info", for: .normal)
        self.view.addSubview(closeButton)
        self.closeButton.frame = CGRect(x: screenWidth/2 - 100, y: screenHeight/2 - 20, width: 200, height: 20)
        self.closeButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

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
