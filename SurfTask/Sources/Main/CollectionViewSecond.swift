//
//  CollectionViewSecond.swift
//  SurfTask
//
//  Created by Sergio on 6.02.23.
//

import UIKit

final class CollectionViewSecond: UIView {

    // MARK: - Properties

    let viewCell = CollectionViewCell()
    let modelArray = Model.item

    // MARK: - UIElements

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
        setDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
    }

    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension CollectionViewSecond: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
        return UICollectionViewCell()

        }
        cell.infoCellLabel.text = modelArray[indexPath.item]
        return cell
    }
}

//// MARK: - UICollectionViewDelegate
//
//extension CollectionViewSecond: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
//}

// MARK: - UICollectionViewDelegateFlowLayout

extension CollectionViewSecond: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = modelArray[indexPath.item]
        return CGSize(width: item.size(withAttributes: [NSAttributedString.Key.font : UIFont.proDisplayMedium14() ?? ""]).width + 48, height: frame.height / 2.3)
    }
}

// MARK: - SetupLayout

extension CollectionViewSecond {

    func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
