//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 18.06.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private let collection = PhotoModel.makeCollection()

    private lazy var colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.toAutoLayout()
//        collectionView.backgroundColor = .red
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    private func viewInitialSettings() {
        self.navigationItem.title = "Photo Gallery"
//        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .systemGray6

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        self.view.addSubview(colletionView)
    }

    private func setupSubviewsLayout() {
        NSLayoutConstraint.activate([
            colletionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            colletionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            colletionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            colletionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: collection[indexPath.item])

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 8 }
    private var verticalInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        let height = width

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        verticalInset
    } // между элементами по вертикали

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    } // между элементами по горизонтали

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: verticalInset, left: sideInset, bottom: verticalInset, right: sideInset)
    } // отступы всех эелемнтов от границ collectionView

}
