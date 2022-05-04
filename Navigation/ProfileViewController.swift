//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 03.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            profileView.frame = CGRect(x: 20, y: 20, width: screenWidth - 40, height: screenHeight - 40)
            view.addSubview(profileView)
        }

    }

}
