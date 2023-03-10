//
//  HideKeyboardExtension.swift
//  TextFields
//
//  Created by Artem Shcherban on 15.03.2022.
//

import UIKit

extension UIViewController {
    
    func setupHideKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
