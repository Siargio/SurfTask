//
//  PresentationViewController.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

final class PresentationView: UIView {

    let collectionView = CollectionView()
    let collectionViewSecond = CollectionViewSecond()
    var bottomHeight = NSLayoutConstraint()

    // MARK: - UIElements

    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Strings.backgroundImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var presentationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Metrics.viewCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let doYouWantLabel = UILabel(
        textAlignment: .center,
        text: Strings.doYouWantButtonText,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    lazy var joinButton = UIButton(
        text: Strings.joinButtonText,
        font: .proDisplayMedium16())

    let titleLabel = UILabel(
        text: Strings.titleLabelText,
        font: .proDisplayBold24(),
        textColor: CommonColor.customBlack)

    let descriptionInfoLabel = UILabel(
        text: Strings.descriptionInfoLabel,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    let descriptionInfoSecondLabel = UILabel(
        alpha: Metrics.alpha,
        text: Strings.descriptionInfoSecondLabel,
        font: .proDisplayRegular14(),
        textColor: CommonColor.customGrayTex)

    lazy var recognizer: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer()
        return recognizer
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(backgroundImage)
        addSubview(presentationView)

        presentationView.addSubview(titleLabel)
        presentationView.addSubview(descriptionInfoLabel)
        presentationView.addSubview(descriptionInfoSecondLabel)
        presentationView.addSubview(doYouWantLabel)
        presentationView.addSubview(joinButton)
        presentationView.addSubview(collectionView)
        presentationView.addSubview(collectionViewSecond)

        presentationView.addGestureRecognizer(recognizer)
    }

    private func setupLayout() {
        bottomHeight = presentationView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: Metrics.bottomHeight)

        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            presentationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            presentationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            presentationView.heightAnchor.constraint(equalTo: heightAnchor),
            bottomHeight,

            titleLabel.topAnchor.constraint(equalTo: presentationView.topAnchor, constant: Metrics.top),
            titleLabel.leadingAnchor.constraint(equalTo: presentationView.leadingAnchor, constant: Metrics.leading),
            titleLabel.trailingAnchor.constraint(equalTo: presentationView.trailingAnchor, constant: Metrics.trailing),

            descriptionInfoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.topSecond),
            descriptionInfoLabel.leadingAnchor.constraint(equalTo: presentationView.leadingAnchor, constant: Metrics.leading),
            descriptionInfoLabel.trailingAnchor.constraint(equalTo: presentationView.trailingAnchor, constant: Metrics.trailing),

            descriptionInfoSecondLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Metrics.top),
            descriptionInfoSecondLabel.leadingAnchor.constraint(equalTo: presentationView.leadingAnchor, constant: Metrics.leading),
            descriptionInfoSecondLabel.trailingAnchor.constraint(equalTo: presentationView.trailingAnchor, constant: Metrics.trailing),

            doYouWantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.leading),
            doYouWantLabel.trailingAnchor.constraint(equalTo: joinButton.leadingAnchor),
            doYouWantLabel.heightAnchor.constraint(equalToConstant: Metrics.heightButton),
            doYouWantLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            joinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.trailing),
            joinButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Metrics.joinButtonWidth),
            joinButton.heightAnchor.constraint(equalToConstant: Metrics.heightButton),
            joinButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            collectionView.topAnchor.constraint(equalTo: descriptionInfoLabel.bottomAnchor, constant: Metrics.topSecond),
            collectionView.leadingAnchor.constraint(equalTo: presentationView.leadingAnchor, constant: Metrics.leading),
            collectionView.trailingAnchor.constraint(equalTo: presentationView.trailingAnchor, constant: Metrics.trailing),
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metrics.heightFirstCollectionView),

            collectionViewSecond.topAnchor.constraint(equalTo: descriptionInfoSecondLabel.bottomAnchor, constant: Metrics.topSecond),
            collectionViewSecond.leadingAnchor.constraint(equalTo: presentationView.leadingAnchor, constant: Metrics.leading),
            collectionViewSecond.trailingAnchor.constraint(equalTo: presentationView.trailingAnchor, constant: Metrics.trailing),
            collectionViewSecond.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metrics.heightSecondCollectionView)
        ])
    }
}

// MARK: - Metrics

extension PresentationView {
    enum Metrics {
        static let leading : CGFloat =  20
        static let trailing: CGFloat =  -20
        static let top: CGFloat = 24
        static let topSecond: CGFloat = 12
        static let heightButton: CGFloat = 60
        static let joinButtonWidth: CGFloat = 0.59
        static let sizeFontDisplayBold: CGFloat = 24
        static let viewCornerRadius: CGFloat = 32
        static let alpha: CGFloat = 0
        static let bottomHeight: CGFloat = 66
        static let heightFirstCollectionView: CGFloat = 0.055
        static let heightSecondCollectionView: CGFloat = 0.125
    }

    enum Strings {
        static let backgroundImage = UIImage(named: "background")
        static let titleLabelText = "Стажировка в Surf"
        static let descriptionInfoLabel = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        static let descriptionInfoSecondLabel = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        static let doYouWantButtonText = "Хочешь к нам?"
        static let joinButtonText = "Отправить заявку"
    }
}
