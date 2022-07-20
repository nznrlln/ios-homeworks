//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 18.06.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {

    private var collection = PhotoModel.makeCollection()

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

    private let imagePublisherFacade = ImagePublisherFacade()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewInitialSettings()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        addSubscription()
        addPhotos()
        view.layoutIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)

        cancelSubscription()
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

    private func addSubscription() {
        print(#function)
        imagePublisherFacade.subscribe(self)
    }

    private func addPhotos() {
        print(#function)
        imagePublisherFacade.addImagesWithTimer(time: 1, repeat: 10)
        colletionView.reloadData()
    }

    private func cancelSubscription() {
        print(#function)
        imagePublisherFacade.rechargeImageLibrary()
        imagePublisherFacade.removeSubscription(for: self)
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photoWidth = (collectionView.bounds.width - (PhotoConstants.collectionLeadingInset + PhotoConstants.collectionTrailingInset + PhotoConstants.collectionItemSpacing * 2)) / 3
        let photoHeight = photoWidth

        return CGSize(width: photoWidth, height: photoHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        PhotoConstants.collectionLineSpacing
    } // между элементами по вертикали

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        PhotoConstants.collectionItemSpacing
    } // между элементами по горизонтали

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: PhotoConstants.collectionTopInset,
                     left: PhotoConstants.collectionLeadingInset,
                     bottom: PhotoConstants.collectionBottomInset,
                     right: PhotoConstants.collectionTrailingInset)
    } // отступы всех эелемнтов от границ collectionView

}

// MARK: - ImageLibrarySubscriber

extension PhotosViewController: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        print(#function)
        let indexPath = IndexPath(item: collection.count, section: 0)
        images.forEach { image in
            collection.append(PhotoModel(photoImage: image))
        }
        self.colletionView.insertItems(at: [indexPath])
    }

}
