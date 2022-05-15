//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .lightGray

        profileHeaderView.addSubview(profileHeaderView.avatar)
        profileHeaderView.addSubview(profileHeaderView.nickname)
        profileHeaderView.addSubview(profileHeaderView.status)
        profileHeaderView.addSubview(profileHeaderView.showStatusButton)
        profileHeaderView.addSubview(profileHeaderView.textField)

        view.addSubview(profileHeaderView)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

//        profileHeaderView.frame = view.frame // если не использовать navig bar и не делать отступы
        profileHeaderView.frame = CGRect(
            x: 0,
            y: self.navigationController?.navigationBar.frame.maxY ?? 0,
            width: view.frame.width,
            height: view.frame.height - (self.navigationController?.navigationBar.frame.height ?? 0)
        )

        profileHeaderView.nickname.frame.size = CGSize(
            width: profileHeaderView.frame.maxX - profileHeaderView.avatar.frame.maxX - 32,
            height: 18
        )

        profileHeaderView.status.frame.size = CGSize(
            width: profileHeaderView.frame.maxX - profileHeaderView.avatar.frame.maxX - 32,
            height: 14
        )

        profileHeaderView.showStatusButton.frame.size = CGSize(
            width: profileHeaderView.frame.maxX - 32,
            height: 50
        )

        profileHeaderView.textField.frame.size = CGSize(
            width: profileHeaderView.frame.maxX - profileHeaderView.avatar.frame.maxX - 32,
            height: 40
        )


//        profileHeaderView.backgroundColor = .systemBrown // для проверки загрузки
    }

}
