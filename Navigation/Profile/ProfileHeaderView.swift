//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 08.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatar: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "sleeping cat"))
        let width: Double = 110
        let height: Double = 110

        avatar.frame = CGRect(x: 16, y: 16, width: width, height: height)
        avatar.layer.cornerRadius = width/2
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true

        return avatar
    }()

    let nickname: UILabel = {
        let nickname = UILabel()
        nickname.text = "Sleeping Cat"
        nickname.font = .systemFont(ofSize: 18, weight: .bold)
        nickname.textColor = .black

        nickname.frame = CGRect(x: 16 + 110 + 16, y: 27, width: 200, height: 18)

        return nickname
    }()

    let status: UILabel = {
        let status = UILabel()
        status.text = "ZzZzZzZzZzZzZzZz..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray

        status.frame = CGRect(x: 16 + 110 + 16, y: 16 + 110 - 18 - 14, width: 200, height: 14)

        return status
    }()

    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black

        textField.frame = CGRect(x: 16 + 110 + 16, y: 16 + 110 - 16, width: 200, height: 40)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor

        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textField
    }()

    let showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.backgroundColor = .blue


        showStatusButton.frame = CGRect(x: 16, y: 16 + 110 - 16 + 40 + 16, width: 300, height: 50)
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7

        showStatusButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return showStatusButton
    }()

    private var statusText: String? = nil


    @objc func handleButtonTap() {
        print(status.text ?? "Status is empty")
        status.text = statusText
        textField.text = nil
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text 
    }

}



