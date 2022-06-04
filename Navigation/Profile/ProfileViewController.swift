//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    let profileButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profile button", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10

        return button
    }()


    private func viewInitialSettings() {
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .lightGray

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(profileButton)
    }

    private func setupSubviewsLayout(){
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            profileButton.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            profileButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            profileButton.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ]) // отдельный активатор привязок для кнопки или все в один объединять?
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

}
