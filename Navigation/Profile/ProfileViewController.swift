//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let posts = PostModel.makeModel()

    var userService: UserService?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.backgroundColor = self.view.backgroundColor

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)

        return tableView
    }()

    init(userService: UserService, userID: String) {
        super.init(nibName: nil, bundle: nil)
        self.showUserData(userService: userService, userID: userID)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
    }

    private func viewInitialSettings() {
        navigationItem.title = "Profile"
        navigationController?.navigationBar.backgroundColor = .white
//        view.backgroundColor = .lightGray

        #if DEBUG
            view.backgroundColor = .lightGray
        #else
            view.backgroundColor = .systemGray6
        #endif

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupSubviewsLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func showUserData(userService: UserService, userID: String) {
        if let userData = userService.checkUser(userID: userID) {
            print("User ID: \(userData.userID)")
            if userData.userAvatar != nil {
                print("User avatar: true")
            } else {
                print("User avatar: false")
            }
            if userData.userStatus != nil {
                print("User status: true")
            } else {
                print("User status: false")
            }

            self.userService = userService
        } else {
            print("Auth failed")
        }
    }

}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell

            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: posts[indexPath.row])

            return cell
        }

    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    // метод для хедера
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = ProfileHeaderView()
            return header
        default:
            let header = UIView()
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            photosVC.navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(photosVC, animated: true)
        }
    }
}

