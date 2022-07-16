//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 08.05.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    private var avatarInitialFrame: CGRect?

    private let avatarImageView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "sleeping cat"))
        avatar.toAutoLayout()
        avatar.layer.cornerRadius = 55
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true

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

    private lazy var statusTextField: CustomUITextField = {
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

    private lazy var showStatusButton: UIButton = {
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

        showStatusButton.addTarget(self, action: #selector(tapStatusButton), for: .touchUpInside)

        return showStatusButton
    }()

    //переменная, которой автоматически будет присваивается значение "строки", введенного в uiTextField
    private var statusText: String? = nil

    private var backgroundInitialFrame: CGRect?

    private let backgroundView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .lightGray
        view.alpha = 0
        view.isHidden = true

        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.alpha = 1
        button.isHidden = true
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6

        setupSubviews()
        setupSubviewsLayout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.addSubviews(nicknameLabel, statusLabel, statusTextField, showStatusButton, backgroundView, avatarImageView, closeButton)
    }
    
    private func setupSubviewsLayout() {

        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(110)
        }

        nicknameLabel.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }

        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(nicknameLabel.snp.leading)
            make.bottom.equalTo(avatarImageView.snp.bottom).inset(32)
        }

        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(8)
            make.leading.equalTo(nicknameLabel.snp.leading)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }

        showStatusButton.snp.makeConstraints { make in
            make.top.equalTo(statusTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        closeButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
        }
    }

    private func setupGestures() {
        let avatarTapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapAction))
        avatarImageView.addGestureRecognizer(avatarTapGesture)
    }

    @objc private func tapStatusButton() {
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

    @objc private func avatarTapAction() {
        debugPrint(#function)

        self.avatarInitialFrame = self.avatarImageView.frame
        self.backgroundInitialFrame = self.backgroundView.frame
        let avatarGrowthRate: CGFloat = UIScreen.main.bounds.width / self.avatarInitialFrame!.width
        let backgroundXRate: CGFloat = UIScreen.main.bounds.width / self.backgroundInitialFrame!.width
        let backgroundYRate: CGFloat = UIScreen.main.bounds.height / self.backgroundInitialFrame!.height

        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut) {
            self.backgroundView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            self.backgroundView.transform = CGAffineTransform(scaleX: backgroundXRate, y: backgroundYRate)
            self.backgroundView.isHidden = false
            self.backgroundView.alpha = 0.8

            self.avatarImageView.center = self.backgroundView.center
            self.avatarImageView.transform = CGAffineTransform(scaleX: avatarGrowthRate, y: avatarGrowthRate)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.isHidden = false
                self.closeButton.alpha = 1
                self.avatarImageView.layer.cornerRadius = 0
            }
        }
    }

    @objc private func tapCloseButton() {
        debugPrint(#function)

        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
            self.closeButton.alpha = 0
        } completion: { _ in
            self.closeButton.isHidden = true
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.alpha = 0
                self.backgroundView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.backgroundView.frame = self.backgroundInitialFrame!

                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarInitialFrame!.height / 2
                self.avatarImageView.frame = self.avatarInitialFrame!
            } completion: { _ in
                self.backgroundView.isHidden = true
            }
        }
    }

}
