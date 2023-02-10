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
}

// MARK: - Metrics

extension MainViewController {
    enum Metrics {
        static let minimumInteritemSpacing : CGFloat =  12
        static let additionalWidth: CGFloat = 48
        static let heightDivision: CGFloat = 2.3
    }

    enum Strings {
        static let alertTitle = "Поздравляем"
        static let alertMessage = "Ваша заявка успешно отправлена!"
    }
}
