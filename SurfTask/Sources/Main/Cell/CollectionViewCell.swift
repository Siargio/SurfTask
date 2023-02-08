//
//  CollectionViewCell.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "cell"

    var isActive: Bool = false {
        didSet {
            toggleColors()
        }
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                isActive.toggle()
            }
        }
    }

    // MARK: - UIElements

    let infoCellLabel = UILabel(
        text: "IOS",
        font: .proDisplayMedium14(),
        textColor: CommonColor.customBlack)

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupView() {
        backgroundColor = CommonColor.customGray
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }

    private func setupHierarchy() {
        addSubview(infoCellLabel)
    }

    private func toggleColors() {
        if isActive {
            backgroundColor = CommonColor.customBlack
            infoCellLabel.textColor = .white
        } else {
            backgroundColor = CommonColor.customGray
            infoCellLabel.textColor = CommonColor.customBlack
        }
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            infoCellLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoCellLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
