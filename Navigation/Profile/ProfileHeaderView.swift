//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 08.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarImageView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "sleeping cat"))
        avatar.translatesAutoresizingMaskIntoConstraints = false
        let radius: Double = 55
        avatar.layer.cornerRadius = radius
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true

        return avatar
    }()

    let nicknameLabel: UILabel = {
        let nickname = UILabel()
        nickname.translatesAutoresizingMaskIntoConstraints = false
        nickname.text = "Sleeping Cat"
        nickname.font = .systemFont(ofSize: 18, weight: .bold)
        nickname.textColor = .black

        return nickname
    }()

    let statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "ZzZzZzZzZzZzZzZz..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray

        return status
    }()

    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor

        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textField
    }()

    let showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.backgroundColor = .blue

        showStatusButton.layer.cornerRadius = 14
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7

        showStatusButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return showStatusButton
    }()

    //переменная, которой автоматически будет присваивается значение "строки", введенного в uiTextField
    private var statusText: String? = nil

    init(){
        super.init(frame: .zero)
        self.backgroundColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false
        setupSubviews()
        setupSubviewsLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
            self.addSubview(avatarImageView)
            self.addSubview(nicknameLabel)
            self.addSubview(statusLabel)
            self.addSubview(statusTextField)
            self.addSubview(showStatusButton)
        }
    
    private func setupSubviewsLayout() {

        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),

            nicknameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            nicknameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),

            statusLabel.leftAnchor.constraint(equalTo: nicknameLabel.leftAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -32),

            statusTextField.leftAnchor.constraint(equalTo: nicknameLabel.leftAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            showStatusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            showStatusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])

    }

    @objc private func handleButtonTap() {
        print(statusLabel.text ?? "Status is empty")
        guard let text = statusText else {
            print("Status field is empty. You need to add something first.")
            return
        } // чтобы не стереть исходный статус значением nil
        statusLabel.text = text
//        statusLabel.text = statusText
        statusTextField.text = nil
    }
    // метод отвечающий за присвоение введенного на экране текста в statusText
    @objc private func statusTextChanged(_ statusTextField: UITextField) {
        statusText = statusTextField.text
    }
}
