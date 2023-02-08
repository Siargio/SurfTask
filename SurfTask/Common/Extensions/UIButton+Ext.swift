//
//  UIButton+Ext.swift
//  SurfTask
//
//  Created by Sergio on 7.02.23.
//

import UIKit

extension UIButton {
    convenience init(text: String, font: UIFont?) {
        self.init(type: .system)

        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.tintColor = .white
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        self.backgroundColor = CommonColor.customBlack
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
