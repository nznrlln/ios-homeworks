//
//  LogInViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 11.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

    var delegate: LoginViewControllerDelegate?

    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()

        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .white

        return view
    }()

    private let logoImageView: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "vkLogo"))
        logo.toAutoLayout()

        return logo
    }()

    private lazy var usernameTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.toAutoLayout()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.autocapitalizationType = .none

        textField.delegate = self
        textField.addTarget(self, action: #selector(usernameTextChanged), for: .editingChanged)

        textField.text = "Sleeping Cat"

        return textField
    }()

    private lazy var passwordTextField: CustomUITextField = {
        let textField = CustomUITextField()
        textField.toAutoLayout()
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true

        textField.delegate = self
        textField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)

        textField.text = "123456"

        return textField
    }()

    private let loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.backgroundColor = .cyan
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally

        return stackView
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "ColorSet")
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)

        switch button.state {
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled:button.alpha = 0.8
        default: button.alpha = 1
        }

        button.setTitle("Log in", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "default", size: 17)
        button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)

        return button
    }()

    private var usernameText: String? = nil
    private var passwordText: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func viewInitialSettings() {
        navigationItem.title = "Log in"
        navigationController?.navigationBar.backgroundColor = .lightGray
        view.backgroundColor = .white

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        loginStackView.addSubviews(usernameTextField, passwordTextField)
        contentView.addSubviews(logoImageView, loginStackView, logInButton)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }

    private func setupSubviewsLayout() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            loginStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),

            usernameTextField.topAnchor.constraint(equalTo: loginStackView.topAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: loginStackView.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor),
            usernameTextField.bottomAnchor.constraint(equalTo: loginStackView.centerYAnchor),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: loginStackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: loginStackView.bottomAnchor),

            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }


    @objc private func loginButtonTap(){

        guard let auth = delegate?.check(username: usernameTextField.text!, password: passwordTextField.text!) else {
            print("nil")
            return
        }
        if auth {
            #if DEBUG
                let currentUser = TestUserService()
            #else
                let currentUser = CurrentUserService()
            #endif
            let loginUsername = usernameTextField.text!
            let profileVC = ProfileViewController(userService: currentUser, userID: loginUsername)
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else {
            print("no auth")
            return
        }
    }

    @objc private func usernameTextChanged(_ usernameTextField: UITextField) {
        usernameText = usernameTextField.text
    }

    @objc private func passwordTextChanged(_ passwordTextField: UITextField) {
        passwordText = passwordTextField.text
    }

}

// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
        // срабатывает когда на клавиатуре нажимаем enter
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
            return true
        }
    }


// MARK: - LoginViewControllerDelegate

protocol LoginViewControllerDelegate: AnyObject {
    func check(username: String, password: String) -> Bool 
}
