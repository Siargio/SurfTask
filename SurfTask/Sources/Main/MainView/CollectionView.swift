//
//  CollectionView.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

final class CollectionView: UIView {

    // MARK: - Properties

    var modelArray = Model.item

    // MARK: - UIElements

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = Metrics.minimumInteritemSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
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
        fatalError(Strings.error)
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

extension CollectionView: UICollectionViewDataSource {
    
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

extension CollectionView: UICollectionViewDelegate {

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

extension CollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = modelArray[indexPath.item]
        return CGSize(width: item.size(withAttributes: [NSAttributedString.Key.font : UIFont.proDisplayMedium14() ?? Strings.fallbackFont]).width + Metrics.additionalWidth, height: frame.height)
    }
}

// MARK: - SetupLayout

extension CollectionView {
    
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

extension CollectionView {
    enum Metrics {
        static let minimumInteritemSpacing : CGFloat =  12
        static let additionalWidth: CGFloat = 48
    }

    enum Strings {
        static let fallbackFont = "Avenir Next"
        static let error = "init(coder:) has not been implemented"
    }
}
