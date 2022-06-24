//
//  MiniPhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 19.06.2022.
//

import UIKit

class MiniPhotosCollectionViewCell: UICollectionViewCell {

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        cellInitialSetting()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(model: PhotoModel) {
        photoImageView.image = model.photoImage
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        photoImageView.image = nil
    }

    private func cellInitialSetting() {
//        self.contentView.backgroundColor = .blue

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        self.contentView.addSubview(photoImageView)
    }

    private func setupSubviewsLayout() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }

}


