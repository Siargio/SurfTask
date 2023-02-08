//
//  PresentationViewController.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

struct Appearance {
    var leading: CGFloat { 20 }
    var trailing: CGFloat { -20 }
    var top: CGFloat { 24 }
    var topSecond: CGFloat { 12 }
    var heightButton: CGFloat { 60 }
    var joinButtonWidth: CGFloat { 0.59 }
    var sizeFontDisplayBold: CGFloat { 24 }
    var heightFirstCollectionView: CGFloat { 0.055 }
    var heightSecondCollectionView: CGFloat  { 0.125 }
}

enum Strings {
    static let titleLabelText: String = "Стажировка в Surf"
    static let descriptionInfoLabel = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    static let descriptionInfoSecondLabel = "Получай стипендию, выстраивай удобный график, работай на современном железе."
    static let doYouWantButtonText = "Хочешь к нам?"
    static let joinButtonText = "Отправить заявку"
}

final class PresentationController: UIView {

    let appearance = Appearance()
    let collectionView = CollectionView()
    let collectionViewSecond = CollectionViewSecond()

    // MARK: - UIElements

    private let doYouWantLabel = UILabel(
        textAlignment: .center,
        text: Strings.doYouWantButtonText,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    lazy var joinButton = UIButton(
        text: Strings.joinButtonText,
        font: .proDisplayMedium16())

    private let titleLabel = UILabel(
        text: Strings.titleLabelText,
        font: .proDisplayBold24(),
        textColor: CommonColor.customBlack)

    private let descriptionInfoLabel = UILabel(
        text: Strings.descriptionInfoLabel,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    private let descriptionInfoSecondLabel = UILabel(
        text: Strings.descriptionInfoSecondLabel,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionInfoLabel)
        addSubview(descriptionInfoSecondLabel)
        addSubview(doYouWantLabel)
        addSubview(joinButton)
        addSubview(collectionView)
        addSubview(collectionViewSecond)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: appearance.top),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),

            descriptionInfoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: appearance.topSecond),
            descriptionInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            descriptionInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),

            descriptionInfoSecondLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: appearance.top),
            descriptionInfoSecondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            descriptionInfoSecondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),

            doYouWantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            doYouWantLabel.trailingAnchor.constraint(equalTo: joinButton.leadingAnchor),
            doYouWantLabel.heightAnchor.constraint(equalToConstant: appearance.heightButton),
            doYouWantLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            joinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),
            joinButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: appearance.joinButtonWidth),
            joinButton.heightAnchor.constraint(equalToConstant: appearance.heightButton),
            joinButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            collectionView.topAnchor.constraint(equalTo: descriptionInfoLabel.bottomAnchor, constant: appearance.topSecond),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: appearance.heightFirstCollectionView),

            collectionViewSecond.topAnchor.constraint(equalTo: descriptionInfoSecondLabel.bottomAnchor, constant: appearance.topSecond),
            collectionViewSecond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: appearance.leading),
            collectionViewSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: appearance.trailing),
            collectionViewSecond.heightAnchor.constraint(equalTo: heightAnchor, multiplier: appearance.heightSecondCollectionView)
        ])
    }
}
