//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 16.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let collection = PhotoModel.makeCollection()

    private let customContentView: UIView = {
        let customView = UIView()
        customView.toAutoLayout()
//        customView.backgroundColor = .systemPink

        return customView
    }()

    private let photosLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Photos"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)

        return label
    }()

    private let photosButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)

        return button
    }()

    private lazy var miniCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.toAutoLayout()
        collectionView.register(MiniPhotosCollectionViewCell.self, forCellWithReuseIdentifier: MiniPhotosCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cellInitialSettings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // метод подготавливающий ячейку для переиспользования
    override func prepareForReuse() {
        super.prepareForReuse()

    }

    private func cellInitialSettings() {
//        contentView.backgroundColor = .red // покраска ячейки ломает ее подсвечивание при нажатии

        setupSubviews()
        setupSubviewsLayout()
    }


    private func setupSubviews() {
        customContentView.addSubviews(photosLabel, photosButton, miniCollectionView)
        self.contentView.addSubview(customContentView)
    }

    private func setupSubviewsLayout(){

        let photoWidth: CGFloat = (UIScreen.main.bounds.width - (PhotoConstants.tableInset * 2 + PhotoConstants.collectionItemSpacing * 3)) / 4
        let photoHeight = photoWidth

        NSLayoutConstraint.activate([
            customContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            customContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            customContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            customContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            photosLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: PhotoConstants.tableInset),
            photosLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: PhotoConstants.tableInset),
            photosLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),

            photosButton.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -PhotoConstants.tableInset),
            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),

            miniCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            miniCollectionView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            miniCollectionView.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -(PhotoConstants.tableInset - PhotoConstants.collectionItemSpacing)),
            miniCollectionView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor),
            miniCollectionView.heightAnchor.constraint(equalToConstant: PhotoConstants.tableInset * 2 + photoHeight)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiniPhotosCollectionViewCell.identifier, for: indexPath) as! MiniPhotosCollectionViewCell
        cell.setupCell(model: collection[indexPath.item])

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - (PhotoConstants.tableInset * 2 + PhotoConstants.collectionItemSpacing * 3)) / 4
        let height = width

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return PhotoConstants.collectionLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: PhotoConstants.tableInset,
                            left: PhotoConstants.tableInset,
                            bottom: PhotoConstants.tableInset,
                            right: PhotoConstants.tableInset)
    }
}
