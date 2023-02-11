//
//  UIImageView+Ext.swift
//  SurfTask
//
//  Created by Sergio on 11.02.23.
//

import UIKit

extension UIImageView {

    convenience init(imageView: UIImage?) {
        self.init()

        self.image = imageView
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
