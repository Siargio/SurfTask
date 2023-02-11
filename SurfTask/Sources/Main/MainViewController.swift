//
//  MainViewController.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties

    let customView = PresentationView()
    private var animations = [UIViewPropertyAnimator]()
    private var states: States = .small
    var isBool = true

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTarget()
    }

    // MARK: - Setup

    private func setupTarget() {
        customView.joinButton.addTarget(self, action: #selector(joinButtonTap), for: .touchUpInside)

        customView.recognizer.addTarget(self, action: #selector(movement(_:)))
    }

    @objc func joinButtonTap() {
        isBool.toggle()
        changeFavorite(isBool: isBool, button: customView.joinButton)

        alertInfo(title: Strings.alertTitle, message: Strings.alertMessage)
    }

    private func changeFavorite(isBool: Bool, button: UIButton) {
        if isBool {
            button.backgroundColor = CommonColor.customBlack
            button.tintColor = .white
        } else {
            button.backgroundColor = .clear
            button.tintColor = CommonColor.customGrayTex
        }
    }

    // MARK: - recognizer

    @objc private func movement(_ recognizer: UIPanGestureRecognizer) {

        switch recognizer.state {
        case .began:
            let translation = recognizer.translation(in: customView.presentationView)
            translation.y >= 0 ? animate(to: states.previous, duration: Metrics.duration, translation: translation.y) :
            animate(to: states.opposite, duration: Metrics.duration, translation: translation.y)

        case .changed:
            let representation = Metrics.representation
            let translation = recognizer.translation(in: customView.presentationView)
            let fraction = abs(translation.y / representation)

            animations.forEach { (animator) in
                animator.fractionComplete = fraction
            }

        case .ended:
            animations.forEach {
                $0.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        default:
            break
        }
    }

    private func animate(to state: States, duration: TimeInterval, translation: CGFloat) {

        let transitionAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn)

        transitionAnimator.addAnimations { [weak self] in
            switch state {
            case .xSmall:
                self?.customView.bottomHeight.constant = Metrics.xSmallSize
                self?.customView.descriptionInfoLabel.fadeOut()
                self?.customView.collectionView.collectionView.fadeOut()
            case .small:
                self?.customView.bottomHeight.constant = Metrics.smallSize
                self?.customView.descriptionInfoLabel.fadeIn()
                self?.customView.collectionView.collectionView.fadeIn()
                self?.customView.descriptionInfoSecondLabel.fadeOut()
                self?.customView.collectionViewSecond.collectionView.fadeOut()
            case .medium:
                self?.customView.bottomHeight.constant = Metrics.mediumSize
                self?.customView.descriptionInfoSecondLabel.fadeIn()
                self?.customView.collectionViewSecond.collectionView.fadeIn()
            case .large:
                self?.customView.bottomHeight.constant = Metrics.largeSize
            }
            self?.view.layoutIfNeeded()
        }

        guard animations.isEmpty else { return }

        transitionAnimator.addCompletion { [self] (animator) in
            animations.removeAll()
            self.states = translation >= 0 ? states.previous : states.opposite
        }
        animations.append(transitionAnimator)
    }
}

// MARK: - Metrics

extension MainViewController {
    enum Metrics {
        static let representation: CGFloat = 1000
        static let xSmallSize: CGFloat = 655
        static let smallSize: CGFloat = 525
        static let mediumSize: CGFloat = 355
        static let largeSize: CGFloat = 55
        static let duration: CGFloat = 0.3
    }

    enum Strings {
        static let alertTitle = "Поздравляем!"
        static let alertMessage = "Ваша заявка успешно отправлена!"
    }
}
