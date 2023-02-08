//
//  AlertModel.swift
//  SurfTask
//
//  Created by Sergio on 7.02.23.
//

import UIKit

extension UIViewController {

    func alertInfo(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let close = UIAlertAction(title: "Закрыть", style: .default)

        alert.addAction(close)

        present(alert, animated: true, completion: nil)
    }
}
