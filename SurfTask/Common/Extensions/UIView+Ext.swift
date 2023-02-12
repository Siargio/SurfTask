//
//  UIView+Ext.swift
//  SurfTask
//
//  Created by Sergio on 10.02.23.
//

import UIKit

extension UIView {

    convenience init(cornerRadius: CGFloat, backgroundColor: UIColor?) {
        self.init()

        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func fadeIn(_ duration: TimeInterval = 0.2, delay: TimeInterval = 0.2, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(_ duration: TimeInterval = 0.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.alpha = 0
            }, completion: completion)
        }
    }
}
