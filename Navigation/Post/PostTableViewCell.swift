//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 12.06.2022.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {

    private let customContentView: UIView = {
        let customView = UIView()
        customView.toAutoLayout()
//        customView.backgroundColor = .systemPink

        return customView
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2

        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0

        return label
    }()

    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black

        return label
    }()

    private let viewsCountLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cellInitialSettings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(model: PostModel) {
        authorLabel.text = model.author
//        postImageView.image = UIImage(named: model.imageName)
        postImageView.image = filterImage(UIImage(named: model.imageName)!)

        descriptionLabel.text = model.description
        likesCountLabel.text = "Likes: \(model.likes)"
        viewsCountLabel.text = "Views: \(model.views)"
    }

    private func filterImage(_ initialImage: UIImage) -> UIImage {
        var image = UIImage()
        let imageProcessor = ImageProcessor()
        imageProcessor.processImage(sourceImage: initialImage, filter: .crystallize(radius: 1)) { filteredImage in
            image = filteredImage ?? UIImage()
            debugPrint("Filter applied successfully")
        }
        return image
    }


    // метод подготавливающий ячейку для переисползования
    override func prepareForReuse() {
        super.prepareForReuse()

        authorLabel.text = ""
        postImageView.image = nil
        descriptionLabel.text = ""
        likesCountLabel.text = ""
        viewsCountLabel.text = ""
    }

    private func cellInitialSettings() {
//        contentView.backgroundColor = .red // покраска ячейки ломает ее подсвечивание при нажатии

        setupSubviews()
        setupSubviewsLayout()
    }

    private func setupSubviews() {
        customContentView.addSubviews(authorLabel, postImageView, descriptionLabel, likesCountLabel, viewsCountLabel)
        contentView.addSubview(customContentView)
    }

    private func setupSubviewsLayout(){

        let textInset: CGFloat = 16
        let imageInset: CGFloat = 12

        NSLayoutConstraint.activate([
            customContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            authorLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: textInset),
            authorLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: textInset),
            authorLabel.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -textInset),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: imageInset),
            postImageView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: textInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: textInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -textInset),

            likesCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: textInset),
            likesCountLabel.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor, constant: textInset),
            likesCountLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -textInset),

            viewsCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: textInset),
            viewsCountLabel.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -textInset),
            viewsCountLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -textInset)
        ])
    }
}
