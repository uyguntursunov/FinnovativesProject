//
//  UIViewController + Ext.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 12/04/25.
//

import UIKit

extension UIViewController {
    func displayErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
