//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let posts = PostModel.makeModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .purple
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    private func viewInitialSettings() {
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.backgroundColor = .lightGray

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setupSubviewsLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: posts[indexPath.row]) 

        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    // метод для хедера
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()

        NSLayoutConstraint.activate([
            header.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ]) // иначе хедер вью сжимается по ширине

        return header
    }

    // настройка высоты header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        220
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Profile"
    }


}
