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
        let radius: Double = 55
        avatar.frame = CGRect.zero
        avatar.layer.cornerRadius = radius
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true

        return avatar
    }()

    let nicknameLabel: UILabel = {
        let nickname = UILabel()
        nickname.text = "Sleeping Cat"
        nickname.font = .systemFont(ofSize: 18, weight: .bold)
        nickname.textColor = .black
        nickname.frame = CGRect.zero

        return nickname
    }()

    let statusLabel: UILabel = {
        let status = UILabel()
        status.text = "ZzZzZzZzZzZzZzZz..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.frame = CGRect.zero

        return status
    }()

    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.frame = CGRect.zero
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

        showStatusButton.frame = CGRect.zero
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7

        showStatusButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)

        return showStatusButton
    }()

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

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false

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
        // точного макета с кнопкой нет - сделал как получилось
    }

    //переменная, которой автоматически будет присваивается значение "строки", введенного в uiTextField
    private var statusText: String? = nil

    @objc func handleButtonTap() {
        print(statusLabel.text ?? "Status is empty")
        statusLabel.text = statusText
        statusTextField.text = nil
    }
    // метод отвечающий за присвоение введенного на экране текста в statusText
    @objc func statusTextChanged(_ statusTextField: UITextField) {
        statusText = statusTextField.text
    }
}
/*
 Вопросы:
 1. можно ли как то добавить subview внутри класса UIView?
 типа self.addSubview(avatar) - ругается
 на stackOverflow - кто-то пытался сделать это через drawRect, но ему настоятельно рекомендовали от этого отказаться и делать все через viewDidLoad в контроллере
 нашел один вариант - func setupSubviews, или бывает еще более удобный способ?

 2. обязательно обзывать "avatarImageView", "fullNameLabel" и тд? В реальной работе и проектах в названии элемента указывают от какого класса он наследуется? как avatar от UIImageView? -
 ответ - да.  "2.9 Включайте в имена информацию о типе данных, если он не очевиден."

 3. В каких местах надо 100% указывать "translatesAutoresizingMaskIntoConstraints = false"?

 4. Перегрузил ли я метод viewInitialSettings добавив в него "setupSubviews()" и "setupSubviewsLayout()"?
 или лучше эти методы вызывать отдельно в viewDidLoad?
*/
