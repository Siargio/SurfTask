//
//  ViewController.swift
//  SurfTask
//
//  Created by Sergio on 5.02.23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    let customView = PresentationController()
    var isBool = true

    // MARK: - UIElements

    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupTarget()
    }

    // MARK: - Setup

    func setupHierarchy() {
        view.addSubview(backgroundImage)
    }

    func setupTarget() {
        customView.joinButton.addTarget(self, action: #selector(joinButtonTap), for: .touchUpInside)
    }

    @objc func joinButtonTap() {
        isBool.toggle()
        changeFavorite(isBool: isBool, button: customView.joinButton)

        alertInfo(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!")
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

extension ViewController {

    func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
