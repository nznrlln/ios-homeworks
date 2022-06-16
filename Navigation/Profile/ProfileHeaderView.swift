//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 08.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private let avatarImageView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "sleeping cat"))
        avatar.toAutoLayout()
        avatar.layer.cornerRadius = 55
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true

        return avatar
    }()

    private let nicknameLabel: UILabel = {
        let nickname = UILabel()
        nickname.toAutoLayout()
        nickname.text = "Sleeping Cat"
        nickname.font = .systemFont(ofSize: 18, weight: .bold)
        nickname.textColor = .black

        return nickname
    }()

    private let statusLabel: UILabel = {
        let status = UILabel()
        status.toAutoLayout()
        status.text = "ZzZzZzZzZzZzZzZz..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray

        return status
    }()

    private let statusTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.toAutoLayout()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Set your status..."

        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return textField
    }()

    private let showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.toAutoLayout()
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5

        setupSubviews()
        setupSubviewsLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {

        self.addSubviews(avatarImageView, nicknameLabel, statusLabel, statusTextField, showStatusButton)

    }
    
    private func setupSubviewsLayout() {

        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),

            nicknameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nicknameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusLabel.leadingAnchor.constraint(equalTo: nicknameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -32),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: nicknameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            showStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
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
        statusTextField.text = nil
    }
    // метод отвечающий за присвоение введенного на экране текста в statusText
    @objc private func statusTextChanged(_ statusTextField: UITextField) {
        statusText = statusTextField.text
    }
}
