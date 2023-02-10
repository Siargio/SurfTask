//
//  CollectionViewSecond.swift
//  SurfTask
//
//  Created by Sergio on 6.02.23.
//

import UIKit

final class CollectionViewSecond: UIView {

    // MARK: - Properties

    var modelArray = Model.item

    // MARK: - UIElements

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = Metrics.minimumInteritemSpacing
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.alpha = Metrics.alpha
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

    private func setupHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
    }

    private func setDelegates() {
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

// MARK: - UICollectionViewDelegate

extension CollectionViewSecond: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = modelArray[indexPath.item]
        modelArray.remove(at: indexPath.item)
        modelArray.insert(selectedItem, at: 0)

        collectionView.moveItem(at: indexPath, to: IndexPath(item: 0, section: 0))
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CollectionViewSecond: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = modelArray[indexPath.item]
        return CGSize(width: item.size(withAttributes: [NSAttributedString.Key.font : UIFont.proDisplayMedium14() ?? Strings.fallbackFont]).width + Metrics.additionalWidth, height: frame.height / Metrics.heightDivision)
    }
}

// MARK: - SetupLayout

extension CollectionViewSecond {

    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Metrics

extension CollectionViewSecond {
    enum Metrics {
        static let minimumInteritemSpacing: CGFloat =  12
        static let alpha: CGFloat = 0
        static let additionalWidth: CGFloat = 48
        static let heightDivision: CGFloat = 2.3
    }

    enum Strings {
        static let fallbackFont = "Avenir Next"
    }
}
