//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 16.06.2022.
//

//import UIKit
//
//class PhotosTableViewCell: UITableViewCell {
//
//    private let customContentView: UIView = {
//        let customView = UIView()
//        customView.toAutoLayout()
////        customView.backgroundColor = .systemPink
//
//        return customView
//    }()
//
//    private let photosLabel: UILabel = {
//        let label = UILabel()
//        label.toAutoLayout()
//        label.text = "Photos"
//        label.tintColor = .black
//        label.font = .systemFont(ofSize: 24, weight: .bold)
//
//        return label
//    }()
//
//    private let photosButton: UIButton = {
//        let button = UIButton()
//        button.toAutoLayout()
//        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
//
//        return button
//    }()
//
//    private let photoImageView1: UIImageView = {
//        let imageView = UIImageView()
//        imageView.toAutoLayout()
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }()
//
//    private let photoImageView2: UIImageView = {
//        let imageView = UIImageView()
//        imageView.toAutoLayout()
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }()
//
//    private let photoImageView3: UIImageView = {
//        let imageView = UIImageView()
//        imageView.toAutoLayout()
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }()
//
//    private let photoImageView4: UIImageView = {
//        let imageView = UIImageView()
//        imageView.toAutoLayout()
//        imageView.layer.cornerRadius = 6
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        cellInitialSettings()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
////    func setupPhotoCell(model: PhotoModel) {
//        func setupCell() {
////        photoImageView1.image = UIImage(named: "1")
////        photoImageView2.image = model.photoImage
////        photoImageView3.image = model.photoImage
////        photoImageView4.image = model.photoImage
//
//        photoImageView1.image = UIImage(named: "1")
//        photoImageView2.image = UIImage(named: "2")
//        photoImageView3.image = UIImage(named: "3")
//        photoImageView4.image = UIImage(named: "4")
//
//    }
//
//    // метод подготавливающий ячейку для переисползования
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        photoImageView1.image = nil
//        photoImageView2.image = nil
//        photoImageView3.image = nil
//        photoImageView4.image = nil
//    }
//
//    private func cellInitialSettings() {
////        contentView.backgroundColor = .red // покраска ячейки ломает ее подсвечивание при нажатии
//
//        setupSubviews()
//        setupSubviewsLayout()
//    }
//
//
//    private func setupSubviews() {
//        customContentView.addSubviews(photosLabel, photosButton, photoImageView1, photoImageView2, photoImageView3, photoImageView4)
//        self.contentView.addSubview(customContentView)
//    }
//
//    private func setupSubviewsLayout(){
//
//        let inset: CGFloat = 12
//        let imagesInset: CGFloat = 8
//        let photoWidth: CGFloat = (UIScreen.main.bounds.width - (inset * 2 + imagesInset * 3)) / 4
//        let photoHeight = photoWidth
//
//        NSLayoutConstraint.activate([
//            customContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            customContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            customContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            customContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//
//            photosLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: inset),
//            photosLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: inset),
//            photosLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
//
//            photosButton.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -inset),
//            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
//
//            photoImageView1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
//            photoImageView1.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: inset),
//            photoImageView1.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -inset),
//            photoImageView1.heightAnchor.constraint(equalToConstant: photoHeight),
//            photoImageView1.widthAnchor.constraint(equalToConstant: photoWidth),
//
//            photoImageView2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
//            photoImageView2.leadingAnchor.constraint(equalTo: photoImageView1.trailingAnchor, constant: imagesInset),
//            photoImageView2.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -inset),
//            photoImageView2.heightAnchor.constraint(equalToConstant: photoHeight),
//            photoImageView2.widthAnchor.constraint(equalToConstant: photoWidth),
//
//            photoImageView3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
//            photoImageView3.leadingAnchor.constraint(equalTo: photoImageView2.trailingAnchor, constant: imagesInset),
//            photoImageView3.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -inset),
//            photoImageView3.heightAnchor.constraint(equalToConstant: photoHeight),
//            photoImageView3.widthAnchor.constraint(equalToConstant: photoWidth),
//
//            photoImageView4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
//            photoImageView4.leadingAnchor.constraint(equalTo: photoImageView3.trailingAnchor, constant: imagesInset),
//            photoImageView4.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -inset),
//            photoImageView4.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -inset),
//            photoImageView4.heightAnchor.constraint(equalToConstant: photoHeight),
//            photoImageView4.widthAnchor.constraint(equalToConstant: photoWidth)
//        ])
//    }
//}


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

    func setupCell(model: PhotoModel) {

    }

    // метод подготавливающий ячейку для переисползования
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

        let inset: CGFloat = 12
        let imagesInset: CGFloat = 8
        let photoWidth: CGFloat = (UIScreen.main.bounds.width - (inset * 2 + imagesInset * 3)) / 4
        let photoHeight = photoWidth

        NSLayoutConstraint.activate([
            customContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            customContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            customContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            customContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

            photosLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: inset),
            photosLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: inset),
            photosLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),

            photosButton.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -inset),
            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),

            miniCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            miniCollectionView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            miniCollectionView.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -(inset - imagesInset)),
            miniCollectionView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor),
            miniCollectionView.heightAnchor.constraint(equalToConstant: inset * 2 + photoHeight)
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

    private var inset: CGFloat { return 12 }
    private var imagesInset: CGFloat  { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - (inset * 2 + imagesInset * 3)) / 4
        let height = width

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imagesInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
